class Human

attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board, current_player)
		puts "Player #{marker} choose a square (1-9) to place your marker on."
		choice = gets.chomp.to_i
		while board.ttt_board[choice-1].class != Fixnum do
			puts "Position occupied.  Please try again."
			choice = gets.chomp.to_i
		end
		position = choice - 1
	end

end