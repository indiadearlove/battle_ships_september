require 'sinatra/base'

class BattleShips < Sinatra::Base
  get '/' do
    erb :index
  end

  get'/new_game' do
    @visitor = params[:name]
    erb :new_game
  end

  get'/player2' do
    @visitor = params[:name]
    erb :player2
  end

  get '/placing_player1_ships' do
    @coord = params[:coord]
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
