require "minitest/autorun"
require_relative "./boardp.rb"
require_relative "./unbeatablep.rb"

class TestUnbeatable < Minitest::Test

	def test_winblock_position8
		board = TTTBoard.new
		board.ttt_board = ["X","O",3,4,"X","O",7,8,9]
		unbeatable = Unbeatable.new("X")
		result = unbeatable.check_winsblocks(board,"X")
		assert_equal(8,result)
	end	

	def test_winblock_position6
		board = TTTBoard.new
		board.ttt_board = ["O","X","X","O",5,6,7,8,9]
		unbeatable = Unbeatable.new("O")
		result = unbeatable.check_winsblocks(board,"O")
		assert_equal(6,result)
	end		

	def test_winblock_position4
	 	board = TTTBoard.new
	 	board.ttt_board = ["O","X","X","O",5,"O",7,"X",9]
	 	unbeatable = Unbeatable.new("O")
	 	result = unbeatable.check_winsblocks(board,"O")
	 	assert_equal(4,result)
	end		

	def test_fork_block_position0
	 	board = TTTBoard.new
	 	board.ttt_board = [1,2,3,"X","O",6,7,"X",9]
	 	unbeatable = Unbeatable.new("O")
	 	result = unbeatable.check_forks(board,"O")
	 	assert_equal(0,result)
	end

	def test_fork_block_position0

	 	board = TTTBoard.new
	 	board.ttt_board = [1,"X",3,4,"O","X",7,8,9]
	 	unbeatable = Unbeatable.new("O")
	 	result = unbeatable.check_forks(board,"O")
	 	assert_equal(2, result)
	end

	def test_center_free
	 	board = TTTBoard.new
	 	board.ttt_board = [1,2,3,4,5,6,7,8,9]
	 	unbeatable = Unbeatable.new("X")
	 	result = unbeatable.center_free?(board)
	 	assert_equal(true,result)
	end

	def test_center_occupied
	 	board = TTTBoard.new
	 	board.ttt_board = [1,2,3,4,"O",6,7,8,9]
	 	unbeatable = Unbeatable.new("X")
	 	result = unbeatable.center_free?(board)
	 	assert_equal(false,result)
	end

	def test_diagonal_corner0
	  	board = TTTBoard.new
	  	board.ttt_board = [1,2,3,4,5,6,7,8,"O"]
	  	unbeatable = Unbeatable.new("X")
	  	result = unbeatable.check_corner_diagonal(board,"X")
	  	assert_equal(0,result)
	end

	def test_diagonal_corner2
	 	board = TTTBoard.new
	 	board.ttt_board = [1,2,3,4,5,6,"O",8,9]
	 	unbeatable = Unbeatable.new("X")
	 	result = unbeatable.check_corner_diagonal(board,"X")
	 	assert_equal(2,result)
	end

	def test_diagonal_corner6
	    board = TTTBoard.new
	 	board.ttt_board = [1,2,"X",4,5,6,7,8,9]
	 	unbeatable = Unbeatable.new("O")
	 	result = unbeatable.check_corner_diagonal(board,"O")
	 	assert_equal(6,result)
	end

	def test_diagonal_corner8
	 	board = TTTBoard.new
	 	board.ttt_board = ["O",2,3,4,5,6,7,8,9]
	 	unbeatable = Unbeatable.new("X")
	 	result = unbeatable.check_corner_diagonal(board,"X")
	 	assert_equal(8,result)
	end

	def test_open_corner
	 	board = TTTBoard.new
	 	board.ttt_board = [1,"O",3,4,5,6,7,8,9]
	 	unbeatable = Unbeatable.new("X")
	 	result = unbeatable.check_open_corner(board,"X")
	 	assert_equal(0,result)
	end

	def test_open_side
	 	board = TTTBoard.new
	 	board.ttt_board = ["X",1,3,4,5,6,7,8,9]
	 	unbeatable = Unbeatable.new("O")
	 	result = unbeatable.check_open_side(board,"O")
	 	assert_equal(1,result)
	end

	def test_get_move_win
		board = TTTBoard.new
		board.ttt_board = ["X","O",3,4,"X","O",7,8,9]
		unbeatable = Unbeatable.new("X")
		result = unbeatable.get_move(board,"X")
		assert_equal(8,result)
	end

	def test_block_corner_at8
		board = TTTBoard.new
		board.ttt_board = [1,2,"X",4,"O",6,7,"X",9]
		unbeatable = Unbeatable.new("O")
		result = unbeatable.get_move(board,"O")
		assert_equal(8,result)
	end

	def test_block_corner_at2
		board = TTTBoard.new
		board.ttt_board = [1,"X",3,4,"O",6,7,8,"X"]
		unbeatable = Unbeatable.new("O")
		result = unbeatable.get_move(board,"O")
		assert_equal(2,result)
	end

	def test_block_corner_at0
		board = TTTBoard.new
		board.ttt_board = [1,2,"X","X","O",6,7,8,9]
		unbeatable = Unbeatable.new("O")
		result = unbeatable.get_move(board,"O")
		assert_equal(0,result)
	end

	def test_block_corner_at_8
		board = TTTBoard.new
		board.ttt_board = [1,2,3,4,"O","X","X",8,9]
		unbeatable = Unbeatable.new("O")
		result = unbeatable.get_move(board,"O")
		assert_equal(8,result)
	end
end