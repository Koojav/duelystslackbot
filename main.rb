require 'sinatra'
require './controllers/input_controller'

set :bind, '0.0.0.0'

get '/duelystcardgnome' do
  model = DCG::Controllers::Input.get_model(params)
  model.view.value
end

post '/duelystcardgnome' do
  model = DCG::Controllers::Input.get_model(params)
  model.view.value
end