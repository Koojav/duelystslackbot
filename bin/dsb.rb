require 'sinatra'
require './controllers/input'
require './utils/commands'
require './utils/config'

set :bind, '0.0.0.0'
set :port, DSB::Config.get[:application_settings][:port]

post "/#{DSB::Config.get[:application_settings][:card_command_endpoint]}" do
  content_type :json

  model = DSB::Controllers::Input.get_model(DSB::Utils::Commands::CARD, params)
  model.view
end

post "/#{DSB::Config.get[:application_settings][:refresh_cards_command_endpoint]}" do
  content_type :json

  model = DSB::Controllers::Input.get_model(DSB::Utils::Commands::REFRESH_DATA, params)
  model.view
end