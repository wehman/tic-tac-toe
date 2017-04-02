require "minitest/autorun"
require_relative "./boardp.rb"
require_relative "./sequentialp.rb"

class TestSequential < Minitest::Test

	def test_sequential_1
		board = TTTBoard.new
		board.ttt_board = ["O",2,3,4,"X",6,7,8,9]
		sequential = Sequential.new("X")
		result = sequential.get_move(board,"X")
		assert_equal(1,result)
	end	

	def test_sequential_0
		board = TTTBoard.new
		board.ttt_board = [1,2,3,4,5,6,7,8,"X"]
		sequential = Sequential.new("O")
		result = sequential.get_move(board,"O")
		assert_equal(0,result)
	end		

end