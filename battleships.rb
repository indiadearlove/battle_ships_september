require 'sinatra/base'

class BattleShips < Sinatra::Base
  
  set :views, Proc.new { File.join(root, "templates") }

  get '/' do
    erb :index
    'Hello BattleShips!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
