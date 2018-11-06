# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby assignment
# Change the following tests with your own name and student ID.
# NB. Failure to do so will result in marks being deducted.
# IMPORTANT: Ensure you save the file after making the changes. 
# DO notchange the names of the files. Just ensure you backup the files often.

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
# https://en.wikipedia.org/wiki/Wheel_of_Fortune_(UK_game_show)
require "#{File.dirname(__FILE__)}/wad_cf_gen_01"

# predefined method - NOT to be removed
def check_winner
	# check columns for player 1 win
	i = 0
	while i < 7 do
		if @game.matrix[i][0] == "O" && @game.matrix[i][1] == "O" && @game.matrix[i][2] == "O"  && @game.matrix[i][3] == "O" then
			@game.winner = 1
		elsif @game.matrix[i][1] == "O" && @game.matrix[i][2] == "O" && @game.matrix[i][3] == "O"  && @game.matrix[i][4] == "O" then
			@game.winner = 1			
		elsif @game.matrix[i][2] == "O" && @game.matrix[i][3] == "O" && @game.matrix[i][4] == "O"  && @game.matrix[i][5] == "O" then
			@game.winner = 1
		elsif @game.matrix[i][3] == "O" && @game.matrix[i][4] == "O" && @game.matrix[i][5] == "O"  && @game.matrix[i][6] == "O" then
			@game.winner = 1
		end
		i = i + 1
	end
	# check columns for player 2 win
	i= 0
	while i < 7 do
		if @game.matrix[i][0] == "X" && @game.matrix[i][1] == "X" && @game.matrix[i][2] == "X"  && @game.matrix[i][3] == "X" then
			@game.winner = 2
		elsif @game.matrix[i][1] == "X" && @game.matrix[i][2] == "X" && @game.matrix[i][3] == "X"  && @game.matrix[i][4] == "X" then
			@game.winner = 2
		elsif @game.matrix[i][2] == "X" && @game.matrix[i][3] == "X" && @game.matrix[i][4] == "X"  && @game.matrix[i][5] == "X" then
			@game.winner = 2
		elsif @game.matrix[i][3] == "X" && @game.matrix[i][4] == "X" && @game.matrix[i][5] == "X"  && @game.matrix[i][6] == "X" then
			@game.winner = 2
		end
		i = i + 1
	end
	# check rows for player 1 win
	i = 0
	while i < 6 do
		if @game.matrix[0][i] == "O" && @game.matrix[1][i] == "O" && @game.matrix[2][i] == "O"  && @game.matrix[3][i] == "O" then
			@game.winner = 1
		elsif @game.matrix[1][i] == "O" && @game.matrix[2][i] == "O" && @game.matrix[3][i] == "O"  && @game.matrix[4][i] == "O" then
			@game.winner = 1			
		elsif @game.matrix[2][i] == "O" && @game.matrix[3][i] == "O" && @game.matrix[4][i] == "O"  && @game.matrix[5][i] == "O" then
			@game.winner = 1
		elsif @game.matrix[3][i] == "O" && @game.matrix[4][i] == "O" && @game.matrix[5][i] == "O"  && @game.matrix[6][i] == "O" then
			@game.winner = 1
		end
		i = i + 1
	end
	# check rows for player 2 win
	i = 0
	while i < 6 do
		if @game.matrix[0][i] == "X" && @game.matrix[1][i] == "X" && @game.matrix[2][i] == "X"  && @game.matrix[3][i] == "X" then
			@game.winner = 2
		elsif @game.matrix[1][i] == "X" && @game.matrix[2][i] == "X" && @game.matrix[3][i] == "X"  && @game.matrix[4][i] == "X" then
			@game.winner = 2			
		elsif @game.matrix[2][i] == "X" && @game.matrix[3][i] == "X" && @game.matrix[4][i] == "X"  && @game.matrix[5][i] == "X" then
			@game.winner = 2
		elsif @game.matrix[3][i] == "X" && @game.matrix[4][i] == "X" && @game.matrix[5][i] == "X"  && @game.matrix[6][i] == "X" then
			@game.winner = 2
		end
		i = i + 1
	end
	# check diagonals left to right for player 1 win
	i = 0
	while i < 4 do
		if @game.matrix[i][0] == "O" && @game.matrix[i+1][1] == "O" && @game.matrix[i+2][2] == "O"  && @game.matrix[i+3][3] == "O" then
			@game.winner = 1
		elsif @game.matrix[i+1][0] == "O" && @game.matrix[i+2][1] == "O" && @game.matrix[i+3][2] == "O"  && @game.matrix[i+4][3] == "O" then
			@game.winner = 1			
		elsif @game.matrix[i+2][0] == "O" && @game.matrix[i+3][1] == "O" && @game.matrix[i+4][2] == "O"  && @game.matrix[i+5][3] == "O" then
			@game.winner = 1
		elsif @game.matrix[i][1] == "O" && @game.matrix[i+1][2] == "O" && @game.matrix[i+2][3] == "O"  && @game.matrix[i+3][4] == "O" then
			@game.winner = 1
		elsif @game.matrix[i+1][1] == "O" && @game.matrix[i+2][2] == "O" && @game.matrix[i+3][3] == "O"  && @game.matrix[i+4][4] == "O" then
			@game.winner = 1			
		elsif @game.matrix[i+2][1] == "O" && @game.matrix[i+3][2] == "O" && @game.matrix[i+4][3] == "O"  && @game.matrix[i+5][4] == "O" then
			@game.winner = 1		
		elsif @game.matrix[i][2] == "O" && @game.matrix[i+1][3] == "O" && @game.matrix[i+2][4] == "O"  && @game.matrix[i+3][5] == "O" then
			@game.winner = 1
		elsif @game.matrix[i+1][2] == "O" && @game.matrix[i+2][3] == "O" && @game.matrix[i+3][4] == "O"  && @game.matrix[i+4][5] == "O" then
			@game.winner = 1			
		elsif @game.matrix[i+2][2] == "O" && @game.matrix[i+3][3] == "O" && @game.matrix[i+4][4] == "O"  && @game.matrix[i+5][5] == "O" then
			@game.winner = 1
		elsif @game.matrix[i][3] == "O" && @game.matrix[i+1][4] == "O" && @game.matrix[i+2][5] == "O"  && @game.matrix[i+3][6] == "O" then
			@game.winner = 1
		elsif @game.matrix[i+1][3] == "O" && @game.matrix[i+2][4] == "O" && @game.matrix[i+3][5] == "O"  && @game.matrix[i+4][6] == "O" then
			@game.winner = 1			
		elsif @game.matrix[i+2][3] == "O" && @game.matrix[i+3][4] == "O" && @game.matrix[i+4][5] == "O"  && @game.matrix[i+5][6] == "O" then
			@game.winner = 1
		end
		i = i + 1
	end
	# check diagonals left to right for player 2 win
	i= 0
	while i < 4 do
		if @game.matrix[i][0] == "X" && @game.matrix[i+1][1] == "X" && @game.matrix[i+2][2] == "X"  && @game.matrix[i+3][3] == "X" then
			@game.winner = 2
		elsif @game.matrix[i+1][0] == "X" && @game.matrix[i+2][1] == "X" && @game.matrix[i+3][2] == "X"  && @game.matrix[i+4][3] == "X" then
			@game.winner = 2
		elsif @game.matrix[i+2][0] == "X" && @game.matrix[i+3][1] == "X" && @game.matrix[i+4][2] == "X"  && @game.matrix[i+5][3] == "X" then
			@game.winner = 2			
		elsif @game.matrix[i][1] == "X" && @game.matrix[i+1][2] == "X" && @game.matrix[i+2][3] == "X"  && @game.matrix[i+3][4] == "X" then
			@game.winner = 2
		elsif @game.matrix[i+1][1] == "X" && @game.matrix[i+2][2] == "X" && @game.matrix[i+3][3] == "X"  && @game.matrix[i+4][4] == "X" then
			@game.winner = 2			
		elsif @game.matrix[i+2][1] == "X" && @game.matrix[i+3][2] == "X" && @game.matrix[i+4][3] == "X"  && @game.matrix[i+5][4] == "X" then
			@game.winner = 2		
		elsif @game.matrix[i][2] == "X" && @game.matrix[i+1][3] == "X" && @game.matrix[i+2][4] == "X"  && @game.matrix[i+3][5] == "X" then
			@game.winner = 2
		elsif @game.matrix[i+1][2] == "X" && @game.matrix[i+2][3] == "X" && @game.matrix[i+3][4] == "X"  && @game.matrix[i+4][5] == "X" then
			@game.winner = 2			
		elsif @game.matrix[i+2][2] == "X" && @game.matrix[i+3][3] == "X" && @game.matrix[i+4][4] == "X"  && @game.matrix[i+5][5] == "X" then
			@game.winner = 2
		elsif @game.matrix[i][3] == "X" && @game.matrix[i+1][4] == "X" && @game.matrix[i+2][5] == "X"  && @game.matrix[i+3][6] == "X" then
			@game.winner = 2
		elsif @game.matrix[i+1][3] == "X" && @game.matrix[i+2][4] == "X" && @game.matrix[i+3][5] == "X"  && @game.matrix[i+4][6] == "X" then
			@game.winner = 2			
		elsif @game.matrix[i+2][3] == "X" && @game.matrix[i+3][4] == "X" && @game.matrix[i+4][5] == "X"  && @game.matrix[i+5][6] == "X" then
			@game.winner = 2			
		end
		i = i + 1
	end

	# puts "check_winner: #{@game.matrix}"
	@game.winner
end

module CF_Game
	# RSpec Tests 
	describe Game do
		describe "#start the game" do
			before(:each) do
				@input = double('input').as_null_object
				@output = double('output').as_null_object
				@game = Game.new(@input, @output)
			end
			it "should send a welcome message" do
				@output.should_receive(:puts).with('Welcome to Connect 4!')
				@game.start
			end
			it "should contain a method created_by which returns the students name" do
				myname = @game.created_by
				myname.should == "Nigel Beacham"	# -----Change text to your own name-----
			end
			it "should contain a method student_id which returns the students ID number" do
				studentid = @game.student_id
				studentid.should == 123456789		# -----Change ID to your own student ID number-----
			end
			it "should send a created by message" do
				@output.should_receive(:puts).with("Created by:#{@game.created_by}")
				@game.start
			end
			it "should send a start message" do
				@output.should_receive(:puts).with('Game started.')
				@game.start			
			end
			it "should show player key." do
				@output.should_receive(:puts).with("Player 1: O and Player 2: X")
				@game.start
			end
			it "should show instructions" do
				@output.should_receive(:puts).with("Enter column number to place token.")
				@game.start
			end
			it "should display begin game message" do
				@output.should_receive(:puts).with('Begin game.')
				@game.displaybegingame			
			end
			it "should display new game created message" do
				@output.should_receive(:puts).with('New game created.')
				@game.displaynewgamecreated			
			end
			it "should send a finish message" do
				@output.should_receive(:puts).with('Game finished.')
				@game.finish			
			end
			it "should display menu" do
				@output.should_receive(:puts).with("Menu: (1)Start | (2)New | (9)Exit\n")
				@game.displaymenu
			end
			it "should prompt player 1" do
				@output.should_receive(:puts).with("Player 1 to enter token (0 returns to menu).")
				@game.displayplayer1prompt
			end
			it "should prompt player 2" do
				@output.should_receive(:puts).with("Player 2 to enter token (0 returns to menu).")
				@game.displayplayer2prompt
			end
			it "should display a invalid iput error message" do
				@output.should_receive(:puts).with('Invalid input.')
				@game.displayinvalidinputerror			
			end
			it "should display a no more room error message" do
				@output.should_receive(:puts).with('No more room.')
				@game.displaynomoreroomerror			
			end
			it "should display player 1 wins message" do
				p = 1
				@output.should_receive(:puts).with("Player #{p} wins.")
				@game.displaywinner(p)			
			end
			it "should display player 2 wins message" do
				p = 2
				@output.should_receive(:puts).with("Player #{p} wins.")
				@game.displaywinner(p)			
			end
			it "should set token of player 1 to O" do
				@game.setplayer1
				@game.player1.should eql "O"
			end
			it "should set token of player 2 to X" do
				@game.setplayer2
				@game.player2.should eql "X"
			end
			it "should get token of player 1" do
				@game.setplayer1
				@game.getplayer1.should eql "O"
			end
			it "should get token of player 2" do
				@game.setplayer2
				@game.getplayer2.should eql "X"
			end
			it "should initialise each position in each column in matrix as _" do
				matrix = []
				matrix[0] = ["_", "_", "_", "_", "_", "_"]
				matrix[1] = ["_", "_", "_", "_", "_", "_"]
				matrix[2] = ["_", "_", "_", "_", "_", "_"]
				matrix[3] = ["_", "_", "_", "_", "_", "_"]
				matrix[4] = ["_", "_", "_", "_", "_", "_"]
				matrix[5] = ["_", "_", "_", "_", "_", "_"]
				matrix[6] = ["_", "_", "_", "_", "_", "_"]
				@game.clearcolumns
				@game.matrix.should eql matrix
			end
			it "should get a column value at a given position in matrix" do
				@game.clearcolumns
				value = @game.getcolumnvalue(0,0)
				value.should == "_"
			end
			it "should set a column value at a given position in matrix to 'O'" do
				c = 0
				i = 0
				v = "O"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v)
				@game.matrix[c][i].should == v				
			end
			it "should set a column value at a given position in matrix to 'X'" do
				c = 0
				i = 0
				v = "X"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v)
				@game.matrix[c][i].should == v				
			end
			it "should only overwrite an empty square containing _" do
				c = 0
				i = 0
				v1 = "X"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v1)
				@game.matrix[c][i].should == v1				
				c = 0
				i = 0
				v2 = "O"
				@game.setmatrixcolumnvalue(c,  i, v2)
				@game.matrix[c][i].should == v1				
			end
			it "should only overwrite an empty square containing _" do
				c = 0
				i = 0
				v1 = "O"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v1)
				@game.matrix[c][i].should == v1				
				c = 0
				i = 0
				v2 = "X"
				@game.setmatrixcolumnvalue(c,  i, v2)
				@game.matrix[c][i].should == v1				
			end
			it "should display empty matrix as a table 7 columns by 6 rows" do
				matrix = []
				matrix[0] = ["_", "_", "_", "_", "_", "_"]
				matrix[1] = ["_", "_", "_", "_", "_", "_"]
				matrix[2] = ["_", "_", "_", "_", "_", "_"]
				matrix[3] = ["_", "_", "_", "_", "_", "_"]
				matrix[4] = ["_", "_", "_", "_", "_", "_"]
				matrix[5] = ["_", "_", "_", "_", "_", "_"]
				matrix[6] = ["_", "_", "_", "_", "_", "_"]
				@game.clearcolumns
				@game.matrix.should eql matrix
				title = " 1 2 3 4 5 6 7 "
				rowdivider = "+-+-+-+-+-+-+-+"
				rowempty = "|_|_|_|_|_|_|_|"
				@output.should_receive(:puts).with("#{title}")
				for i in 1..7
					@output.should_receive(:puts).with("#{rowdivider}")
				end
				for i in 1..6
					@output.should_receive(:puts).with("#{rowempty}")
				end
				@game.displayemptyframe
			end
			
			# test player 1 column starting at 0,0
			it "should check for player 1 win within column 1 starting at position 1" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  0, "O")
				@game.setmatrixcolumnvalue(0,  1, "O")
				@game.setmatrixcolumnvalue(0,  2, "O")
				@game.setmatrixcolumnvalue(0,  3, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end
			it "should check for player 1 win within column 1 starting at position 2" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  1, "O")
				@game.setmatrixcolumnvalue(0,  2, "O")
				@game.setmatrixcolumnvalue(0,  3, "O")
				@game.setmatrixcolumnvalue(0,  4, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end
			it "should check for player 1 win within column 1 starting at position 3" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  2, "O")
				@game.setmatrixcolumnvalue(0,  3, "O")
				@game.setmatrixcolumnvalue(0,  4, "O")
				@game.setmatrixcolumnvalue(0,  5, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end

			# test player 1 row starting at 0,0
			it "should check for player 1 win within row 1 starting at position 1" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  0, "O")
				@game.setmatrixcolumnvalue(1,  0, "O")
				@game.setmatrixcolumnvalue(2,  0, "O")
				@game.setmatrixcolumnvalue(3,  0, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end
			it "should check for player 1 win within row 1 starting at position 2" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(1,  0, "O")
				@game.setmatrixcolumnvalue(2,  0, "O")
				@game.setmatrixcolumnvalue(3,  0, "O")
				@game.setmatrixcolumnvalue(4,  0, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end
			it "should check for player 1 win within row 1 starting at position 3" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(2,  0, "O")
				@game.setmatrixcolumnvalue(3,  0, "O")
				@game.setmatrixcolumnvalue(4,  0, "O")
				@game.setmatrixcolumnvalue(5,  0, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end
			it "should check for player 1 win within row 1 starting at position 4" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(3,  0, "O")
				@game.setmatrixcolumnvalue(4,  0, "O")
				@game.setmatrixcolumnvalue(5,  0, "O")
				@game.setmatrixcolumnvalue(6,  0, "O")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end

			# test player 2 column starting at 0,0
			it "should check for player 1 win within column 1 starting at position 1" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  0, "X")
				@game.setmatrixcolumnvalue(0,  1, "X")
				@game.setmatrixcolumnvalue(0,  2, "X")
				@game.setmatrixcolumnvalue(0,  3, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end
			it "should check for player 1 win within column 1 starting at position 2" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  1, "X")
				@game.setmatrixcolumnvalue(0,  2, "X")
				@game.setmatrixcolumnvalue(0,  3, "X")
				@game.setmatrixcolumnvalue(0,  4, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end
			it "should check for player 1 win within column 1 starting at position 3" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  2, "X")
				@game.setmatrixcolumnvalue(0,  3, "X")
				@game.setmatrixcolumnvalue(0,  4, "X")
				@game.setmatrixcolumnvalue(0,  5, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end

			# test player 2 row starting at 0,0
			it "should check for player 2 win within row 1 starting at position 1" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(0,  0, "X")
				@game.setmatrixcolumnvalue(1,  0, "X")
				@game.setmatrixcolumnvalue(2,  0, "X")
				@game.setmatrixcolumnvalue(3,  0, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end
			it "should check for player 2 win within row 1 starting at position 2" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(1,  0, "X")
				@game.setmatrixcolumnvalue(2,  0, "X")
				@game.setmatrixcolumnvalue(3,  0, "X")
				@game.setmatrixcolumnvalue(4,  0, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end
			it "should check for player 2 win within row 1 starting at position 3" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(2,  0, "X")
				@game.setmatrixcolumnvalue(3,  0, "X")
				@game.setmatrixcolumnvalue(4,  0, "X")
				@game.setmatrixcolumnvalue(5,  0, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end
			it "should check for player 2 win within row 1 starting at position 4" do
				@game.winner = nil
				@game.clearcolumns
				@game.setmatrixcolumnvalue(3,  0, "X")
				@game.setmatrixcolumnvalue(4,  0, "X")
				@game.setmatrixcolumnvalue(5,  0, "X")
				@game.setmatrixcolumnvalue(6,  0, "X")
				@game.displayframecolumnvalues
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end

		end
	end

end