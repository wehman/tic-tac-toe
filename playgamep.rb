require_relative "consolep.rb"

puts "Tic-Tac-Toe Awaits\n\n"

puts """Choose your type of game:
	1 = Two Human Players
	2 = Player vs Sequential
	3 = Player vs Random
	4 = Player vs Unbeatable"""
print " --> "

type = gets.chomp.to_i

puts """\n\nChoose your board marker:
	1 = X
	2 = O"""
print " --> "
	
marker_type = gets.chomp.to_i

case marker_type

	when 1	
		player1_marker = "X"
		player2_marker = "O"
	when 2	
		player1_marker = "O"
		player2_marker = "X"
end
	
case type

	when 1

		player1 = Human.new(player1_marker)
		player2 = Human.new(player2_marker)
		game = Console.new(player1,player2)

	when 2

		player1 = Human.new(player1_marker)
		player2 = Sequential.new(player2_marker)
		game = Console.new(player1,player2)	

	when 3
		
		player1 = Human.new(player1_marker)
		player2 = Randoms.new(player2_marker)
		game = Console.new(player1,player2)
	
	when 4

		player1 = Human.new(player1_marker)
		player2 = Unbeatable.new(player2_marker)
		game = Console.new(player1,player2)
		 
end

	game.display_board
	until game.game_over?
#		puts "at start game loop"
		game.change_player(@current_player)
# => 	puts "after change player", @current_player
		position = game.get_move
		game.update_board(position)
		game.display_board
#		puts "in game loop end"
	end
	game.display_game_status