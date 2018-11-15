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
			newgame
		end

		# Initialises every variable for a new game
		def newgame
			clearcolumns
			setplayer1
			setplayer2
			@turn = getplayer1
			@waiting = getplayer2
			@winner = nil
		end
		
		def getinput
			txt = @input.gets.chomp
			return txt
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.

		# Prints a welcome message
		def start
			@output.puts("Welcome to Connect 4!")
			@output.puts("Created by: #{created_by} \nStudent IDs: #{student_id}")
			@output.puts("Game started.")
			@output.puts("Player 1: #{getplayer1} and Player 2: #{getplayer2}")
			@output.puts("Enter column number to place token.")
		end

		# Returns the student name
		def created_by
			return "Andrei Rotariu & Valerio Bucci"
		end

		# Returns the student ID
		def student_id
			return "51876039 & 51875080"
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
		def displaywinner()
			@output.puts("Player #{@winner} wins.")
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

		# From the token returns the player's number
		def tokenToPlayer(token)
			if token == getplayer1
				return 1
			end

			return 2
		end

		# Places the token at the bottom of the grid
		def placeToken(c)
			i = @matrix[c].length - 1
			if !isFilled(c, 0)
				while i >= 0 and @matrix[c][i] != "_"
					i -= 1
				end
				setmatrixcolumnvalue(c, i, @turn)
				checkwinner(c, i)
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

		def checkRow(col, row)
			score = 1
			player = @matrix[col][row]

			# check for win on the left
			c = col - 1
			while score < 4 and c >= 0 and @matrix[c][row] == player
				score += 1
				c -= 1
			end

			# check for win on the right
			c = col + 1
			while score < 4 and c < @matrix.length and @matrix[c][row] == player
				score += 1
				c += 1
			end

			return score > 3
		end

		def checkColumn(col, row)
			score = 1
			player = @matrix[col][row]

			# Check for win below
			r = row + 1
			while score < 4 and r < @matrix[col].length and @matrix[col][r] == player
				score += 1
				r += 1
			end

			# Check for win above
			r = row - 1
			while score < 4 and r >= 0 and @matrix[col][r] == player
				score += 1
				r -= 1
			end

			return score > 3
		end

		def checkDiagTopRight(col, row)
			score = 1
			player = @matrix[col][row]

			# Check for win below
			r = row + 1
			c = col + 1
			while score < 4 and r < @matrix[col].length and c < @matrix.length and @matrix[c][r] == player
				score += 1
				r += 1
				c += 1
			end

			# Check for win above
			r = row - 1
			c = col - 1
			while score < 4 and r >= 0 and c >= 0 and @matrix[col][r] == player
				score += 1
				r -= 1
				c -= 1
			end

			return score > 3
		end

		def checkDiagTopLeft(col, row)
			score = 1
			player = @matrix[col][row]

			# Check for win below
			r = row + 1
			c = col - 1
			while score < 4 and r < @matrix[col].length and c >= 0 and @matrix[c][r] == player
				score += 1
				r += 1
				c -= 1
			end

			# Check for win above
			r = row - 1
			c = col + 1
			while score < 4 and r >= 0 and c < @matrix.length and @matrix[col][r] == player
				score += 1
				r -= 1
				c += 1
			end

			return score > 3
		end
		
		# Checks if somebody won
		def checkwinner(c, i)
			# If a winner is found change @winner variable
			if checkRow(c, i) || checkColumn(c, i) || checkDiagTopRight(c, i) || checkDiagTopLeft(c, i)
				@winner = tokenToPlayer(@matrix[c][i])
			end

			# return the winner
			return @winner
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end
