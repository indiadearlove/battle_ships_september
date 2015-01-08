require 'sinatra/base'
require_relative 'lib/board'
require_relative 'lib/ship'
require_relative 'lib/water'
require_relative 'lib/cell'
require_relative 'lib/game'
require_relative 'lib/player'

class BattleShips < Sinatra::Base

  enable :sessions

  get '/' do
    session[:game] = Game.new
    erb :index
  end

  get'/new_game' do
    @visitor = params[:name]
    @game = session[:game]
    if @visitor and @visitor != ""
      player1 = Player.new
      player2 = Player.new
      player1.name = params[:name]
      player2.name = params[:name]
      player1.board = Board.new(Cell)
      player2.board = Board.new(Cell)
      session[:game].add_players(player1, player2)
    end
    erb :new_game
  end

  get '/placing_player1_ships' do
      erb :placing_player1_ships
  end

  post '/placing_player1_ships' do
    @game = session[:game]
    
    @coord_ac_p1 = params[:coord_ac_p1].to_sym
    @coord_bs_p1 = params[:coord_bs_p1].to_sym
    @coord_d_p1 = params[:coord_d_p1].to_sym
    @coord_s_p1 = params[:coord_s_p1].to_sym
    @coord_pb_p1 = params[:coord_pb_p1].to_sym

    @orientation_ac_p1 = params[:orientation_ac_p1].to_sym
    @orientation_bs_p1 = params[:orientation_bs_p1].to_sym
    @orientation_d_p1 = params[:orientation_d_p1].to_sym
    @orientation_s_p1 = params[:orientation_s_p1].to_sym
    @orientation_pb_p1 = params[:orientation_pb_p1].to_sym    

    @placed_ac_p1 = session[:game].player1.board.place(Ship.aircraft_carrier, @coord_ac_p1, @orientation_ac_p1)
    @placed_bs_p1 = session[:game].player1.board.place(Ship.battleship, @coord_bs_p1, @orientation_bs_p1)
    @placed_d_p1 = session[:game].player1.board.place(Ship.destroyer, @coord_d_p1, @orientation_d_p1)
    @placed_s_p1 = session[:game].player1.board.place(Ship.submarine, @coord_s_p1, @orientation_s_p1)
    @placed_pb_p1 = session[:game].player1.board.place(Ship.patrol_boat, @coord_pb_p1, @orientation_pb_p1)
    session[:game] = @placed_ac_p1  #saving ac position to the session
    session[:game] = @placed_bs_p1
    session[:game] = @placed_d_p1
    session[:game] = @placed_s_p1
    session[:game] = @placed_pb_p1
    puts @game.inspect
    redirect '/placing_player2_ships'
  end

  get '/placing_player2_ships' do
      erb :placing_player2_ships 
  end

  post '/placing_player2_ships' do
    @game = session[:game]
    
    @coord_ac_p2 = params[:coord_ac_p2].to_sym
    @coord_bs_p2 = params[:coord_bs_p2].to_sym
    @coord_d_p2 = params[:coord_d_p2].to_sym
    @coord_s_p2 = params[:coord_s_p2].to_sym
    @coord_pb_p2 = params[:coord_pb_p2].to_sym

    @orientation_ac_p2 = params[:orientation_ac_p2].to_sym
    @orientation_bs_p2 = params[:orientation_bs_p2].to_sym
    @orientation_d_p2 = params[:orientation_d_p2].to_sym
    @orientation_s_p2 = params[:orientation_s_p2].to_sym
    @orientation_pb_p2 = params[:orientation_pb_p2].to_sym    

    @placed_ac_p2 = session[:game].player2.board.place(Ship.aircraft_carrier, @coord_ac_p2, @orientation_ac_p2)
    @placed_bs_p2 = session[:game].player2.board.place(Ship.battleship, @coord_bs_p2, @orientation_bs_p2)
    @placed_d_p2 = session[:game].player2.board.place(Ship.destroyer, @coord_d_p2, @orientation_d_p2)
    @placed_s_p2 = session[:game].player2.board.place(Ship.submarine, @coord_s_p2, @orientation_s_p2)
    @placed_pb_p2 = session[:game].player2.board.place(Ship.patrol_boat, @coord_pb_p2, @orientation_pb_p2)
    session[:game] = @placed_ac_p2
    session[:game] = @placed_bs_p2
    session[:game] = @placed_d_p2
    session[:game] = @placed_s_p2
    session[:game] = @placed_pb_p2
    puts @game.inspect
    redirect '/placing_player2_ships'
  end

  get '/player1_fire' do
    @coord = params[:coord]
    erb :player1_fire
  end

  get '/player2_fire' do
    @coord = params[:coord]
    erb :player2_fire
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
