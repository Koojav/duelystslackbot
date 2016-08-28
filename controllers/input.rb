require './models/card'
require './models/refresh_stored_data'
require './models/error'
require './delegates/data_storage/sqlite'
require './delegates/data_acquisition/duelyst_gamepedia/duelyst_gamepedia'
require './delegates/data_acquisition/duelyst_db/duelyst_db'
require './delegates/data_storage/json_file'
require './utils/config'

module DSB
  module Controllers
    class Input

      # Decides which data model will handle the process next according to received command
      # @param [String] command One of the constants from : DSB::Utils::CommandParser, represents action to be taken
      # @param [Hash] data Data that accompanies the command from Slack
      # @return [DSB::Models::Base] Returns a model that is responsible for consuming specific command
      def self.get_model(command, params)

        # Command is already recognized when accessing appropriate endpoint
        # Since user can define any command on slack we can't base anything of strings that come in params[:command]
        # but we can safely replace that with our own command constants
        params[:command] = command

        model = case command
          when DSB::Utils::Commands::CARD

            if params[:text].length != 0
              DSB::Models::Card.new(params, DSB::Delegates::DataStorage::SQLite.new)
            else
              DSB::Models::Error.new(params)
            end

          when DSB::Utils::Commands::REFRESH_DATA

            if canRefreshData(params[:user_name], params[:team_domain])
              DSB::Models::RefreshStoredData.new(DSB::Delegates::DataAcquisition::DuelystDb::DuelystDb.new, DSB::Delegates::DataStorage::SQLite.new)
            else
              DSB::Models::Error.new(params)
            end

        end

        model
      end

      # Checks if particular user has permissions to refresh card data
      def self.canRefreshData(user_name, team_domain)
        permissions = DSB::Utils::Config.get[:refresh_cards_permissions]
        user_name == permissions[:user_name] && team_domain == permissions[:team_domain]
      end

    end
  end
end