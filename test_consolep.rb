require "minitest/autorun"
require_relative "consolep.rb"
require_relative "boardp.rb"

class TestConsole < Minitest::Test

	def test_change_player_O
		board = TTTBoard.new 
		game = Console.new("X","O")
		current_player = "O"
		assert_equal("X", game.change_player(current_player))
	end

	def test_change_player_X
		board = TTTBoard.new 
		game = Console.new("O","X")
		current_player = "X"
		assert_equal("O", game.change_player(current_player))
	end

end