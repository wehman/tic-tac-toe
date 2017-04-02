require_relative 'boardp.rb'
require_relative 'consolep.rb'

class Random

	attr_accessor :marker, :board, :current_player

	def initialize(marker)
		@marker = marker
		@board = board
		@current_player = current_player
	end

	def get_move(board, current_player)
	
		free = []
		j = 0
		for i in 0..8
			if board.ttt_board[i] == i+1
   				then
   				free[j] = i
   				j += 1
   			end
   		end
   		p board
   		p free
		position = free.sample
		p position
		return position		
	end
			
end