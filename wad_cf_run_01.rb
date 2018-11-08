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
	input = ""
	option = 0
	turn = 0
	placed = nil
		
	rightInput = false
	while not rightInput
		@output.puts 'Enter "1" runs game in command-line window or "2" runs it in web browser.'
		game = g.getinput
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

		g.start
		g.clearcolumns

	

		while playing

			#g.  Show tokens entered

			#Player1 Turn
			g.displayframecolumnvalues
			g.displayplayer1prompt

			## Add token
			validInput = false

			while !validInput
				input = gets().to_i
				if input > 0 and input <= 7
					validInput = g.placeToken(input - 1, g.getplayer1)

					if !validInput
						g.displaynomoreroomerror
					end
				elsif input == 0
					# pause the game
				else
					g.displayinvalidinputerror
				end
			end


			g.checkwinner

			if g.winner == "X"
				puts("Player 1 Wins!")
				playing = false
			end


			#Player2 Turn
			g.displayframecolumnvalues
			g.displayplayer2prompt

			## Add Token
			validInput = false

			while !validInput
				input = gets().to_i
				if input > 0 and input <= 7
					validInput = g.placeToken(input - 1, g.getplayer2)

					if !validInput
						g.displaynomoreroomerror
					end
				elsif input == 0
					# pause the game
				else
					g.displayinvalidinputerror
				end
			end

			g.checkwinner

			if g.winner == "O"
				puts("Player 2 Wins!")
				playing = false
			end
		end



	
	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.



	# Any code added to output the activity messages to a browser should be added above.

# End program
