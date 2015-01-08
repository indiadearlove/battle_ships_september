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

  # get'/player2' do
  #   @visitor = params[:name]
  #   erb :player2
  # end

  get '/placing_player1_ships' do
    @game = session[:game]
    @coord = params[:coord]
    @orientation = params[:orientation]
    session[:game].player1.board.place(Ship.aircraft_carrier, params[:coord], params[:orientation])
    erb :placing_player1_ships
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
