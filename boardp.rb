class TTTBoard

	attr_accessor :ttt_board
	
	def initialize
		@ttt_board = (1..9).to_a
	end

	def update_position(position, marker)
		# print "in board - position is ", position
		# puts " "
		# print "in board - marker is ", marker
		ttt_board[position] = marker
	end

	def avail_position?(position)
		ttt_board[position].class == Fixnum
	end

	def board_full?
		ttt_board.grep(Fixnum) == []
	end

#	def full_board?()
#		ttt_board.count("1" && "2" && "3" && "4" && "5" && "6" && "7" && "8" && "9") == 0
#	end

	def draw_game?
		board_full? && win_game? == false
	end

	def win_game?
   		wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
            	[0, 3, 6], [1, 4, 7], [2, 5, 8],
            	[0, 4, 8], [2, 4, 6]]

    	wins.each do |sequence|
      		if sequence.all? { |a| ttt_board[a] == 'X' }
        	return true
      		elsif sequence.all? { |a| ttt_board[a] == 'O' }
        	return true
      		end
    	end
    	return false
  	end

end