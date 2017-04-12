require "minitest/autorun"
require_relative "boardp.rb"

class TestTTTBoard < Minitest::Test
	def test_new_board
		board = TTTBoard.new 
		assert_equal([1,2,3,4,5,6,7,8,9],board.ttt_board)
	end

	def test_update_position_2
		board = TTTBoard.new 
		board.update_position(2,"X")
		assert_equal([1,2,"X",4,5,6,7,8,9],board.ttt_board)
	end

	def test_update_position_2_and_position_4
	 	board = TTTBoard.new 
	 	board.update_position(2,"X")
	 	board.update_position(3,"O")
	 	assert_equal([1,2,"X","O",5,6,7,8,9],board.ttt_board)
	end

	def test_available_position_3
	 	board = TTTBoard.new 
	 	board.ttt_board = ["X","X",3,"O","O",6,7,"X","O"]
	 	assert_equal(true,board.avail_position?(2))
	end

	def test_available_position_0
	 	board = TTTBoard.new 
	 	board.ttt_board = ["X","X",3,"O","O",6,7,"X","O"]
	 	assert_equal(false,board.avail_position?(0))
	end

	def test_invalid_position
	 	board = TTTBoard.new 
	 	board.ttt_board = ["X","X",3,"O","O",6,7,"X","O"]
	 	assert_equal(false,board.avail_position?(10))
	end

	def test_full_board
		board = TTTBoard.new 
		board.ttt_board =["X","O","X","O","X","X","O","X","O"]
		assert_equal(true,board.board_full?())
	end

	def test_board_not_full
		board = TTTBoard.new 
		board.ttt_board =[1,"O","X","O","X","X","O","X","O"]
		assert_equal(false,board.board_full?())
	end

	def test_game_tie_yes
		board = TTTBoard.new 
		board.ttt_board =["X","O","X","O","X","X","O","X","O"]
		assert_equal(true,board.draw_game?())
	end

	def test_game_tie_no
		board = TTTBoard.new 
		board.ttt_board =["X","O","X","O","X","X","X","O","O"]
		assert_equal(false,board.draw_game?())
	end

	def test_game_win_yes

		board = TTTBoard.new 
		board.ttt_board = ["X","O","O",3,"X","O","X",8,"X"]
		assert_equal(true,board.win_game?())
	end

	def test_game_win_no

		board = TTTBoard.new 
		board.ttt_board = ["X","O","X","O","X","X","O","X","O"]
		assert_equal(false,board.win_game?())
	end

end