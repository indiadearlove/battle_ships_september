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

  get '/start_game' do
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
