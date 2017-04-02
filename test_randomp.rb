require "minitest/autorun"
require_relative "./boardp.rb"
require_relative "./randomp.rb"

class TestRandom < Minitest::Test

	def test_random_4_last_choice
		board = TTTBoard.new
		board.ttt_board = ["X","O","X","O",5,"O","X","X","O"]
		random = Random.new("X")
		result = random.get_move(board,"X")
		assert_equal(4,result)
	end		

	def test_random_7_free
		board = TTTBoard.new
		board.ttt_board = ["X","O",3,4,5,6,7,8,9]
		random = Random.new("X")
		result = random.get_move(board,"X")
		assert_equal(true,[2,3,4,5,6,7,8].include?(result))
	end

end