# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
# require 'sinatra'		# remove '#' character to run sinatra wen server

# Main class module
module CF_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	TOKEN1 = "O"
	TOKEN2 = "X"

	class Game
		attr_reader :matrix, :player1, :player2, :template, :input, :output, :turn, :waiting, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		attr_writer :matrix, :player1, :player2, :template, :input, :output, :turn, :waiting, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		
		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			txt = @input.gets.chomp
			return txt
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.

		# Prints a welcome message
		def start
			@output.puts("Welcome to Connect 4!")
			@output.puts("Created by:#{created_by}")
			setplayer1
			setplayer2
			@turn = getplayer1
			@waiting = getplayer2
			@output.puts("Game started.")
			@output.puts("Player 1: #{TOKEN1} and Player 2: #{TOKEN2}")
			@output.puts("Enter column number to place token.")
		end
		
		# Returns the student name
		def created_by
			return "Andrei Rotariu & Valerio Bucci"
		end

		# Returns the student ID
		def student_id
			studentid = "51876039 & 51875080"
		end

		# Display begin game message
		def displaybegingame
			@output.puts("Begin game.")
		end

		# Display new game created message
		def displaynewgamecreated
			@output.puts("New game created.")
		end

		# Sends a finish message
		def finish
			@output.puts("Game finished.")
		end

		# Displays the menu
		def displaymenu
			@output.puts("Menu: (1)Start | (2)New | (9)Exit\n")
		end


		# Prompts player 1
		def displayplayer1prompt
			@output.puts("Player 1 to enter token (0 returns to menu).")
		end

		# Prompts player 2
		def displayplayer2prompt
			@output.puts("Player 2 to enter token (0 returns to menu).")
		end

		# Prompts player basing on the turn
		def displaycurrentplayerprompt
			if @turn == getplayer1
				displayplayer1prompt
			else
				displayplayer2prompt
			end
		end

		# Displays an invalid input error message
		def displayinvalidinputerror
			@output.puts("Invalid input.")
		end

		# Displays a no more room error message
		def displaynomoreroomerror
			@output.puts("No more room.")
		end

		# Displays winning player
		def displaywinner(playerToken)
			if playerToken == getplayer1
				player = 1
			else
				player = 2
			end
			@output.puts("Player #{player} wins.")
		end

		# Sets player 1 token
		def setplayer1
			@player1 = TOKEN1
		end

		# Gets player 1 token
		def getplayer1
			return @player1
		end

		# Sets player 2 token
		def setplayer2
			@player2 = TOKEN2
		end

		# Gets player 2 token
		def getplayer2
			return @player2
		end

		# Initialises each position in each column in matrix as _
		def clearcolumns
			@matrix = [
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"],
						["_", "_", "_", "_", "_", "_"]
					]
		end

		# Checks if a cell is occupied by a player's token
		def isFilled(c, i)
			return @matrix[c][i] == TOKEN1 || @matrix[c][i] == TOKEN2
		end

		# Gets a column from a given position in matrix
		def getcolumnvalue(c, i)
			return @matrix[c][i]
		end

		# Sets column value at given position
		def setmatrixcolumnvalue(c, i, v)
			@matrix[c][i] = v
		end

		# Places the token at the bottom of the grid
		def placeToken(c)
			i = @matrix[c].length - 1
			if !isFilled(c, 0)
				while i >= 0 and @matrix[c][i] != "_"
					i -= 1
				end
				setmatrixcolumnvalue(c, i, @turn)
				@turn, @waiting = @waiting, @turn
			else
				return false
			end

			return true
		end

		# Displays the empty matrix as a table 7 columns by 6 rows
		def displayemptyframe
			title = " 1 2 3 4 5 6 7 "
			divider = "+-+-+-+-+-+-+-+"
			row = "|_|_|_|_|_|_|_|"
			@output.puts("#{title}")
			for i in 1..7
				@output.puts("#{divider}")
			end
			for i in 1..6
				@output.puts("#{row}")
			end
		end

		# Displays the matrix with updated values
		def displayframecolumnvalues
			title = " 1 2 3 4 5 6 7 "
			divider = "+-+-+-+-+-+-+-+"
			@output.puts(title)
			@output.puts(divider)
			@matrix[0].each_with_index do |item, row|
				@output.print "|"
				@matrix.each do |slot|
					@output.print slot[row]
					@output.print "|"
				end
				@output.puts("")
			end
			@output.puts(divider)
		end

		# Checks if somebody won
		def checkwinner
			# check columns to see if player 1 won
			i = 0
			while i < 7 do
				if @matrix[i][0] == "O" && @matrix[i][1] == "O" && @matrix[i][2] == "O"  && @matrix[i][3] == "O"
					winner = 1
				elsif @matrix[i][1] == "O" && @matrix[i][2] == "O" && @matrix[i][3] == "O"  && @matrix[i][4] == "O"
					winner = 1
				elsif @matrix[i][2] == "O" && @matrix[i][3] == "O" && @matrix[i][4] == "O"  && @matrix[i][5] == "O"
					winner = 1
				elsif @matrix[i][3] == "O" && @matrix[i][4] == "O" && @matrix[i][5] == "O"  && @matrix[i][6] == "O"
					winner = 1
				end
				i += 1
			end
			# check columns to see if player 2 won
			i = 0
			while i < 7 do
				if @matrix[i][0] == "X" && @matrix[i][1] == "X" && @matrix[i][2] == "X"  && @matrix[i][3] == "X"
					winner = 2
				elsif @matrix[i][1] == "X" && @matrix[i][2] == "X" && @matrix[i][3] == "X"  && @matrix[i][4] == "X"
					winner = 2
				elsif @matrix[i][2] == "X" && @matrix[i][3] == "X" && @matrix[i][4] == "X"  && @matrix[i][5] == "X"
					winner = 2
				elsif @matrix[i][3] == "X" && @matrix[i][4] == "X" && @matrix[i][5] == "X"  && @matrix[i][6] == "X"
					winner = 2
				end
				i += 1
			end
			# check row to see if player 1 won
			i = 0
			while i < 6 do
				if @matrix[0][i] == "O" && @matrix[1][i] == "O" && @matrix[2][i] == "O"  && @matrix[3][i] == "O"
					winner = 1
				elsif @matrix[1][i] == "O" && @matrix[2][i] == "O" && @matrix[3][i] == "O"  && @matrix[4][i] == "O"
					winner = 1
				elsif @matrix[2][i] == "O" && @matrix[3][i] == "O" && @matrix[4][i] == "O"  && @matrix[5][i] == "O"
					winner = 1
				elsif @matrix[3][i] == "O" && @matrix[4][i] == "O" && @matrix[5][i] == "O"  && @matrix[6][i] == "O"
					winner = 1
				end
				i += 1
			end
			# check columns to see if player 2 won
			i = 0
			while i < 6 do
				if @matrix[0][i] == "X" && @matrix[1][i] == "X" && @matrix[2][i] == "X"  && @matrix[3][i] == "X"
					winner = 2
				elsif @matrix[1][i] == "X" && @matrix[2][i] == "X" && @matrix[3][i] == "X"  && @matrix[4][i] == "X"
					winner = 2
				elsif @matrix[2][i] == "X" && @matrix[3][i] == "X" && @matrix[4][i] == "X"  && @matrix[5][i] == "X"
					winner = 2
				elsif @matrix[3][i] == "X" && @matrix[4][i] == "X" && @matrix[5][i] == "X"  && @matrix[6][i] == "X"
					winner = 2
				end
				i += 1
			end
			# check diagonals (top to right) to see if player 1 won
			i = 0
			while i < 4 do
				if @matrix[i][0] == "O" && @matrix[i+1][1] == "O" && @matrix[i+2][2] == "O"  && @matrix[i+3][3] == "O"
					winner = 1
				elsif @matrix[i+1][0] == "O" && @matrix[i+2][1] == "O" && @matrix[i+3][2] == "O"  && @matrix[i+4][3] == "O"
					winner = 1
				elsif @matrix[i+2][0] == "O" && @matrix[i+3][1] == "O" && @matrix[i+4][2] == "O"  && @matrix[i+5][3] == "O"
					winner = 1
				elsif @matrix[i][1] == "O" && @matrix[i+1][2] == "O" && @matrix[i+2][3] == "O"  && @matrix[i+3][4] == "O"
					winner = 1
				elsif @matrix[i+1][1] == "O" && @matrix[i+2][2] == "O" && @matrix[i+3][3] == "O"  && @matrix[i+4][4] == "O"
					winner = 1
				elsif @matrix[i+2][1] == "O" && @matrix[i+3][2] == "O" && @matrix[i+4][3] == "O"  && @matrix[i+5][4] == "O"
					winner = 1
				elsif @matrix[i][2] == "O" && @matrix[i+1][3] == "O" && @matrix[i+2][4] == "O"  && @matrix[i+3][5] == "O"
					winner = 1
				elsif @matrix[i+1][2] == "O" && @matrix[i+2][3] == "O" && @matrix[i+3][4] == "O"  && @matrix[i+4][5] == "O"
					winner = 1
				elsif @matrix[i+2][2] == "O" && @matrix[i+3][3] == "O" && @matrix[i+4][4] == "O"  && @matrix[i+5][5] == "O"
					winner = 1
				elsif @matrix[i][3] == "O" && @matrix[i+1][4] == "O" && @matrix[i+2][5] == "O"  && @matrix[i+3][6] == "O"
					winner = 1
				elsif @matrix[i+1][3] == "O" && @matrix[i+2][4] == "O" && @matrix[i+3][5] == "O"  && @matrix[i+4][6] == "O"
					winner = 1
				elsif @matrix[i+2][3] == "O" && @matrix[i+3][4] == "O" && @matrix[i+4][5] == "O"  && @matrix[i+5][6] == "O"
					winner = 1
				end
				i += 1
			end
			# check diagonals (top to right) to see if player 2 won
			i = 0
			while i < 4 do
				if @matrix[i][0] == "X" && @matrix[i+1][1] == "X" && @matrix[i+2][2] == "X"  && @matrix[i+3][3] == "X"
					winner = 2
				elsif @matrix[i+1][0] == "X" && @matrix[i+2][1] == "X" && @matrix[i+3][2] == "X"  && @matrix[i+4][3] == "X"
					winner = 2
				elsif @matrix[i+2][0] == "X" && @matrix[i+3][1] == "X" && @matrix[i+4][2] == "X"  && @matrix[i+5][3] == "X"
					winner = 2
				elsif @matrix[i][1] == "X" && @matrix[i+1][2] == "X" && @matrix[i+2][3] == "X"  && @matrix[i+3][4] == "X"
					winner = 2
				elsif @matrix[i+1][1] == "X" && @matrix[i+2][2] == "X" && @matrix[i+3][3] == "X"  && @matrix[i+4][4] == "X"
					winner = 2
				elsif @matrix[i+2][1] == "X" && @matrix[i+3][2] == "X" && @matrix[i+4][3] == "X"  && @matrix[i+5][4] == "X"
					winner = 2
				elsif @matrix[i][2] == "X" && @matrix[i+1][3] == "X" && @matrix[i+2][4] == "X"  && @matrix[i+3][5] == "X"
					winner = 2
				elsif @matrix[i+1][2] == "X" && @matrix[i+2][3] == "X" && @matrix[i+3][4] == "X"  && @matrix[i+4][5] == "X"
					winner = 2
				elsif @matrix[i+2][2] == "X" && @matrix[i+3][3] == "X" && @matrix[i+4][4] == "X"  && @matrix[i+5][5] == "X"
					winner = 2
				elsif @matrix[i][3] == "X" && @matrix[i+1][4] == "X" && @matrix[i+2][5] == "X"  && @matrix[i+3][6] == "X"
					winner = 2
				elsif @matrix[i+1][3] == "X" && @matrix[i+2][4] == "X" && @matrix[i+3][5] == "X"  && @matrix[i+4][6] == "X"
					winner = 2
				elsif @matrix[i+2][3] == "X" && @matrix[i+3][4] == "X" && @matrix[i+4][5] == "X"  && @matrix[i+5][6] == "X"
					winner = 2
				end
				i += 1
			end
			# check diagonals (top to left) to see if player 1 won
			i = 0
			while i < 4 do
				if @matrix[i][0] == "O" && @matrix[i-1][1] == "O" && @matrix[i-2][2] == "O"  && @matrix[i-3][3] == "O"
					winner = 1
				elsif @matrix[i-1][0] == "O" && @matrix[i-2][1] == "O" && @matrix[i-3][2] == "O"  && @matrix[i-4][3] == "O"
					winner = 1
				elsif @matrix[i-2][0] == "O" && @matrix[i-3][1] == "O" && @matrix[i-4][2] == "O"  && @matrix[i-5][3] == "O"
					winner = 1
				elsif @matrix[i][1] == "O" && @matrix[i-1][2] == "O" && @matrix[i-2][3] == "O"  && @matrix[i-3][4] == "O"
					winner = 1
				elsif @matrix[i-1][1] == "O" && @matrix[i-2][2] == "O" && @matrix[i-3][3] == "O"  && @matrix[i-4][4] == "O"
					winner = 1
				elsif @matrix[i-2][1] == "O" && @matrix[i-3][2] == "O" && @matrix[i-4][3] == "O"  && @matrix[i-5][4] == "O"
					winner = 1
				elsif @matrix[i][2] == "O" && @matrix[i-1][3] == "O" && @matrix[i-2][4] == "O"  && @matrix[i-3][5] == "O"
					winner = 1
				elsif @matrix[i-1][2] == "O" && @matrix[i-2][3] == "O" && @matrix[i-3][4] == "O"  && @matrix[i-4][5] == "O"
					winner = 1
				elsif @matrix[i-2][2] == "O" && @matrix[i-3][3] == "O" && @matrix[i-4][4] == "O"  && @matrix[i-5][5] == "O"
					winner = 1
				elsif @matrix[i][3] == "O" && @matrix[i-1][4] == "O" && @matrix[i-2][5] == "O"  && @matrix[i-3][6] == "O"
					winner = 1
				elsif @matrix[i-1][3] == "O" && @matrix[i-2][4] == "O" && @matrix[i-3][5] == "O"  && @matrix[i-4][6] == "O"
					winner = 1
				elsif @matrix[i-2][3] == "O" && @matrix[i-3][4] == "O" && @matrix[i-4][5] == "O"  && @matrix[i-5][6] == "O"
					winner = 1
				end
				i += 1
			end
			# check diagonals (top to left) to see if player 2 won
			i = 0
			while i < 4 do
				if @matrix[i][0] == "X" && @matrix[i-1][1] == "X" && @matrix[i-2][2] == "X"  && @matrix[i-3][3] == "X"
					winner = 2
				elsif @matrix[i-1][0] == "X" && @matrix[i-2][1] == "X" && @matrix[i-3][2] == "X"  && @matrix[i-4][3] == "X"
					winner = 2
				elsif @matrix[i-2][0] == "X" && @matrix[i-3][1] == "X" && @matrix[i-4][2] == "X"  && @matrix[i-5][3] == "X"
					winner = 2
				elsif @matrix[i][1] == "X" && @matrix[i-1][2] == "X" && @matrix[i-2][3] == "X"  && @matrix[i-3][4] == "X"
					winner = 2
				elsif @matrix[i-1][1] == "X" && @matrix[i-2][2] == "X" && @matrix[i-3][3] == "X"  && @matrix[i-4][4] == "X"
					winner = 2
				elsif @matrix[i-2][1] == "X" && @matrix[i-3][2] == "X" && @matrix[i-4][3] == "X"  && @matrix[i-5][4] == "X"
					winner = 2
				elsif @matrix[i][2] == "X" && @matrix[i-1][3] == "X" && @matrix[i-2][4] == "X"  && @matrix[i-3][5] == "X"
					winner = 2
				elsif @matrix[i-1][2] == "X" && @matrix[i-2][3] == "X" && @matrix[i-3][4] == "X"  && @matrix[i-4][5] == "X"
					winner = 2
				elsif @matrix[i-2][2] == "X" && @matrix[i-3][3] == "X" && @matrix[i-4][4] == "X"  && @matrix[i-5][5] == "X"
					winner = 2
				elsif @matrix[i][3] == "X" && @matrix[i-1][4] == "X" && @matrix[i-2][5] == "X"  && @matrix[i-3][6] == "X"
					winner = 2
				elsif @matrix[i-1][3] == "X" && @matrix[i-2][4] == "X" && @matrix[i-3][5] == "X"  && @matrix[i-4][6] == "X"
					winner = 2
				elsif @matrix[i-2][3] == "X" && @matrix[i-3][4] == "X" && @matrix[i-4][5] == "X"  && @matrix[i-5][6] == "X"
					winner = 2
				end
				i += 1
			end
			@winner = winner
			# return the winner
			return(@winner)
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
