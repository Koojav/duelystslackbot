require 'sinatra'
require './controllers/input'

set :bind, '0.0.0.0'

post '/duelystcardgnome' do
  content_type :json

  model = DCG::Controllers::Input.get_model(params)
  model.view
end