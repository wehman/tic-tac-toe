require 'sinatra'
require_relative 'boardp.rb'
require_relative 'sequentialp.rb'
require_relative 'randomp.rb'
require_relative 'humanp.rb'
require_relative 'unbeatablep.rb'

'sinatra/reloader' if development?  
enable :sessions

get "/" do
 	erb :welcome_to_game
end

post "/name" do
 	session[:name]=params[:user_name]
 	game_type=params[:game_type].to_i
 	marker=params[:marker].to_i
 	if marker == 1
 		player1_marker = "X"
 		player2_marker = "O"
 	else
 		player1_marker = "O"
 		player2_marker = "X"
 	end
	session[:player1] = Human.new(player1_marker)
	session[:current_player] = session[:player1]
	case game_type
		when 1
			session[:player2] = Human.new(player2_marker)
		when 2
			session[:player2] = Sequential.new(player2_marker)	
		when 3
			session[:player2] = Random.new(player2_marker)
		when 4
			session[:player2] = Unbeatable.new(player2_marker)
	end
	session[:board] = TTTBoard.new
	redirect "/table_display_get_move"
end

get "/table_display_get_move" do
 	erb :table_display_get_move
end	

post "/get_move" do
 	position = params[:position].to_i - 1 # array slot is one less
 	session[:board].update_position(position, session[:current_player].marker)
	redirect "/check_game_status"
end

get "/get_move" do
 	if session[:current_player].class == Human
 		redirect "/table_display_get_move"
 	elsif session[:current_player].class != Human 	
 		position = session[:current_player].get_move(session[:board],session[:current_player])
 		position = position.to_i
		session[:board].update_position(position, session[:current_player].marker)
 	end
 	redirect "/check_game_status"
end

get "/check_game_status" do

 	if session[:board].win_game? || session[:board].draw_game?
 	 	erb :game_over, :locals => {:current_player => session[:current_player].marker}
 		else
			redirect "/change_player"
	end
end

get "/change_player" do
	if session[:current_player] == session[:player1]
 	   session[:current_player] = session[:player2]
 	else
 	   session[:current_player] = session[:player1]   
 	end
 	redirect "/get_move"
end
