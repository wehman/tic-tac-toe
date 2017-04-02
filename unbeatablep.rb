require_relative 'boardp.rb'

class Unbeatable

	attr_accessor :marker, :board, :current_player

	def initialize(marker)
		@marker = marker
		@board = board
		@current_player = current_player
	end

	def get_move(board, current_player)
#p "in get move unbeatable"

		if check_winsblocks(board, current_player) <= 9
#			p "winsblocks "
			return position = check_winsblocks(board, current_player)

		elsif center_free?(board) 
#p "center "
			return position = 4

		elsif check_forks(board, current_player) <= 9
#			p "forks "
			return position = check_forks(board,current_player)

		elsif check_corner_diagonal(board,current_player) <= 9
#			p "corner diagonal"
			return position = check_corner_diagonal(board, current_player)

		elsif check_open_corner(board, current_player) <= 9
#			p "open corner "
			return position = check_open_corner(board, current_player)

		else 
#			p "random choice "
			return position = rand(0..8)

		end
	end

	def check_winsblocks(board, current_player)

		position = 10
		board_played = []
		marker == "X" ? other_marker = "O" : other_marker = "X"
#		p "players follow", marker, other_marker		
		# convert position holders to blank spaces
		for i in 0..8
			if board.ttt_board[i] == marker or 
			   board.ttt_board[i] == other_marker
			   	board_played[i] = board.ttt_board[i]
			else
				board_played[i] = " "
			end
		end
#p board_played
		board_played_positions = [[board_played[0], board_played[1], board_played[2]],
						   [board_played[3], board_played[4], board_played[5]],
						   [board_played[6], board_played[7], board_played[8]],
						   [board_played[0], board_played[3], board_played[6]],
						   [board_played[1], board_played[4], board_played[7]],
						   [board_played[2], board_played[5], board_played[8]], 
						   [board_played[0], board_played[4], board_played[8]],
						   [board_played[2], board_played[4], board_played[6]]]

		board_straight_lines = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		
		board_played_positions.each_with_index do |line, index|
			if (line.count(marker) == 2 && line.count(" ") == 1) ||
			   (line.count(other_marker) == 2 && line.count(" ") == 1)
				return position = board_straight_lines[index][line.index(" ")]
			end
		end
		return position
	end

	def center_free?(board)
		
		if board.ttt_board[4] == 5
			return true
		else
			return false
		end
	end

	def check_forks(board, current_player)

		position = 10
		marker == "X" ? other_marker = "O" : other_marker = "X"
#p "in forks", "marker ", marker, " other_marker ", other_marker
		board_played = []
#		p "players", current_player, other_marker
		for i in 0..8
			if board.ttt_board[i] == marker || 
			   board.ttt_board[i] == other_marker
			   board_played[i]=board.ttt_board[i]
			else
				board_played[i] = " "
			end
		end
#p board_played
		board_played_positions = [[board_played[0], board_played[1], board_played[2]],
						   [board_played[3], board_played[4], board_played[5]],
						   [board_played[6], board_played[7], board_played[8]],
						   [board_played[0], board_played[3], board_played[6]],
						   [board_played[1], board_played[4], board_played[7]],
						   [board_played[2], board_played[5], board_played[8]], 
						   [board_played[0], board_played[4], board_played[8]],
						   [board_played[2], board_played[4], board_played[6]]]

		board_straight_lines = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		# handle opposite corners with opponent and center with marker
#p "before test ", board_played
		if board_played == [" "," ",other_marker," ",marker," ",other_marker," "," "]
			return position = 3
		elsif board_played == [other_marker," "," "," ",marker," "," "," ",other_marker]
			return position = 3
		end		

		board_played_positions.each_with_index do |line, index|
			if (line.count(marker) == 1 && line.count(" ") == 2)
				position = board_straight_lines[index][line.index(" ")]	
#				print "fork 1 ", line, board_straight_lines[index],index
				elsif (line.count(other_marker) == 1 && line.count(" ") == 2)
							    position = board_straight_lines[index][line.index(" ")]				
#						print "fork 2 ", line, board_straight_lines[index],index
			end
		end
#		p "returning from fork ", position
		return position
	end

	def check_corner_diagonal(board, current_player)

		position = 10
		marker == "X" ? other_marker = "O" : other_marker = "X"

		if board.ttt_board[0] == 1 && 
		   board.ttt_board[8] == other_marker
		   return position = 0
		end
		if board.ttt_board[2] == 3 && 
		   board.ttt_board[6] == other_marker
		   return position = 2
		end
		if board.ttt_board[6] == 7 && 
		   board.ttt_board[2] == other_marker
		   return position = 6
		end
		if board.ttt_board[8] == 9 && 
		   board.ttt_board[0] == other_marker
		   return position = 8
		end
		return position
	end	

	def check_open_corner(board, current_player)
		position = 10
		corners = [0,2,6,8]
		corners.each do |index|
			if board.ttt_board[index] != "X" || board.ttt_board[index] != "O"			
				return position = index
			end
		end
		return position
	end

	def check_open_side(board, current_player)
		position = 10
		sides = [1,3,5,7]
		sides.each do |index|
			if board.ttt_board[index] != "X" || board.ttt_board[index] != "O"
				return position = index
			end
		end
		return position
	end

end
