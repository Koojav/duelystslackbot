require 'sinatra'
require './controllers/input'
require './delegates/data_acquisition/duelyst_gamepedia/duelyst_gamepedia'
require './delegates/data_storage/json_file'
require './delegates/data_storage/sqlite'
require './utils/commands'

set :bind, '0.0.0.0'

post '/dsb_card' do
  content_type :json

  model = DSB::Controllers::Input.get_model(DSB::Utils::Commands::CARD, params)
  model.view
end

post '/dsb_refreshcards' do
  content_type :json

  model = DSB::Controllers::Input.get_model(DSB::Utils::Commands::REFRESH_DATA, params)
  model.view
end