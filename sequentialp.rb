require_relative 'boardp.rb'

class Sequential

	attr_accessor :marker, :board, :current_player

	def initialize(marker)
		@marker = marker
		@board = board
		@current_player = current_player
	end

	def get_move(board, current_player)
		
		for i in 0..8
			if board.ttt_board[i] == i+1
   				then
   				sequential_spot = i
   				break
   			end
   		end
		position = sequential_spot
	end

end