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
      player1.name = params[:name]
      player1.board = Board.new(Cell)
      session[:game].add_player(player1)
    end
    erb :new_game
  end

  get '/placing_player1_ships' do
      erb :placing_player1_ships
  end

  post '/placing_player1_ships' do
    @game = session[:game]
    
    @coord_ac = params[:coord_ac].to_sym
    @coord_bs = params[:coord_bs].to_sym
    @coord_d = params[:coord_d].to_sym

    @orientation_ac = params[:orientation_ac].to_sym
    @orientation_bs = params[:orientation_bs].to_sym
    @orientation_d = params[:orientation_d].to_sym


    @placed_ac = session[:game].player1.board.place(Ship.aircraft_carrier, @coord_ac, @orientation_ac)
    @placed_bs = session[:game].player1.board.place(Ship.battleship, @coord_bs, @orientation_bs)
    @placed_d = session[:game].player1.board.place(Ship.destroyer, @coord_d, @orientation_d)
    # @placed_s = session[:game].player1.board.place(Ship.submarine, @coord, @orientation)
    # @placed_pb = session[:game].player1.board.place(Ship.patrol_boat, @coord, @orientation)
    session[:game] = @placed_ac  #saving ac position to the session
    session[:game] = @placed_bs
    # session[:game] = @placed_d
    # session[:game] = @placed_s
    # session[:game] = @placed_pb
    puts @game.inspect
    redirect '/placing_player1_ships'
  end

  get '/placing_player2_ships' do
    @coord = params[:coord]
    erb :placing_player2_ships
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
