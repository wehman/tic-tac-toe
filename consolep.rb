require_relative 'boardp.rb'
require_relative 'sequentialp.rb'
require_relative 'randomp.rb'
require_relative 'humanp.rb'
require_relative 'unbeatablep.rb'

class Console

	attr_accessor :board, :player1, :player2, :current_player

	def initialize(player1, player2)
		@board = TTTBoard.new
		@player1 = player1
		@player2 = player2
		@current_player = player2
	end

	def display_board
        puts "\n -----------"
        @board.ttt_board.each_slice(3) do |row|
        print '  '
        puts row.join(' | ')
        puts ' -----------'
        end
        puts
    end

    def change_player(current_player)

        if @current_player == player1   
             @current_player = player2   
         else
             @current_player = player1 
         end
    end

    def get_move
    	current_player.get_move(board, current_player)
    end

    def update_board(position)
        board.update_position(position, current_player.marker)
    end

    def game_over?
    	if board.win_game? == true
            return true
        elsif board.draw_game? == true
            return true
        else
            return false
        end
    end

    def display_game_status
        if board.win_game?
            puts "The game is over.  Please play again."
            puts "#{current_player.marker} won the game."
        elsif board.draw_game?
            puts "The game ends in a draw."
        end    
    end

end