# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_cf_gen_01"

# Main program
module CF_Game
	@input = STDIN
	@output = STDOUT
	g = Game.new(@input, @output)
	playing = true
		
	rightInput = false
	while not rightInput
		@output.puts 'Enter "1" runs game in command-line window and "2" runs game in web browser.'
		game = g.getinput
		system "cls"
		if game == "1"
			rightInput = true
			@output.puts "Command line game"
		elsif game == "2"
			rightInput = true
			@output.puts "Web-based game"
		else 
			@output.puts "Invalid input! No game selected."
		end
	end
		
	if game == "1"
		
		# Any code added to command line game should be added below.

		pause = false
		g.start
		g.clearcolumns

		while playing
			while !pause and g.checkwinner == nil


				#Player1 Turn
				g.displayframecolumnvalues
				g.displaycurrentplayerprompt

				## Add token
				validInput = false

				while !validInput
					input = gets().to_i
					system "cls"
					if input > 0 and input <= 7
						validInput = g.placeToken(input - 1)

						if !validInput
							g.displaynomoreroomerror
						end
					elsif input == 0
						puts("--------------- GAME PAUSED ---------------")
						validInput = true
						pause = true
					else
						g.displayinvalidinputerror
					end
				end
			end
			if g.winner != nil
				system "cls"
				g.displayframecolumnvalues
				g.displaywinner()
				g.finish
			end

			anOption = false
			while !anOption
				g.displaymenu
				puts("Choose an option: ")
				choice = gets.chomp
				anOption = true
				system "cls"
				if choice == "1"
					puts("Resuming... \n")
				elsif choice == "2"
					# Create a new game
					puts("Creating new match... \n")
					g = Game.new(@input, @output)
					g.clearcolumns
					g.displaynewgamecreated
				elsif choice == "9"
					# Exit the game
					playing = false
				else
					puts("ERROR: #{choice} is not an Option. Try again")
					anOption = false
				end
			end
			# The player chose an option
			pause = false
		end
	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end
	$g = g
end
# End modules

	# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.

	# Initialise the game

	get "/" do
		erb :home, :layout => :cssandjs
	end

	get "/game" do
		erb :game
	end

	get "/game/:column" do
		if $g.winner == nil
			if $g.placeToken(params[:column].to_i)
				if $g.checkwinner == nil
					'{"msg" : "TURN", "data" : "' + $g.waiting.to_s + '"}'
				else
					'{"msg" : "GAME_OVER", "data" : "Player ' + $g.winner.to_s + ' wins!"}'
				end
			else
				'{"msg" : "NO_ROOM", "data" : "No room on this column."}'
			end
		else
			'{"msg" : "GAME_OVER", "data" : "Player ' + $g.winner.to_s + ' wins!"}'
		end
	end

	get "/restart" do
		$g.newgame
	end

	get "/about" do
	   erb :about, :layout => :cssandjs
	end

	# Any code added to output the activity messages to a browser should be added above.

# End program
