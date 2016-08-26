require './models/card'
require './models/refresh_stored_data'
require './models/error'
require './delegates/data_storage/sqlite'
require './delegates/data_acquisition/duelyst_gamepedia/duelyst_gamepedia'
require './delegates/data_acquisition/duelyst_db/duelyst_db'
require './delegates/data_storage/json_file'

module DSB
  module Controllers
    class Input

      # List of commands bot will operate on
      # Add more commands here to extend bot's functionality
      # Commands cannot contain spaces
      COMMAND_CARD          = 'get_card'
      COMMAND_REFRESH_DB    = 'refresh_data'
      COMMAND_REPORT_ERROR  = 'report_error'

      # Analyzes command received from Slack and decides which data model will handle the process next
      # @param [Hash] params Parameters received from Slack's custom command
      # @return [DSB::Models::Base] Returns a model that is responsible for consuming specific command
      def self.get_model(params)

        # TODO: Process commands in proper manner not like a savage
        if params[:text].length > 0
          words = params[:text].split(' ')
          command = words.first.downcase
        else
          command = COMMAND_REPORT_ERROR
        end

        model = case command
          when COMMAND_REFRESH_DB
            DSB::Models::RefreshStoredData.new(DSB::Delegates::DataAcquisition::DuelystDb::DuelystDb.new, DSB::Delegates::DataStorage::SQLite.new)
          when COMMAND_REPORT_ERROR
            DSB::Models::Error.new(params)
          else
            DSB::Models::Card.new(params, DSB::Delegates::DataStorage::SQLite.new)
        end

        model
      end

    end
  end
end