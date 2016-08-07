require 'sinatra'
require './controllers/input'
require './delegates/data_acquisition/duelyst_gamepedia/duelyst_gamepedia'
require './delegates/data_storage/json_file'
require './delegates/data_storage/sqlite'

set :bind, '0.0.0.0'

post '/duelystslackbot' do
  content_type :json

  model = DSB::Controllers::Input.get_model(params)
  model.view
end