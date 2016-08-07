require './models/card'
require './models/refresh_stored_data'
require './models/error'

module DSB
  module Controllers
    class Input

      # List of commands bot will operate on
      # Add more commands here to extend bot's functionality
      # Commands cannot contain spaces
      COMMAND_CARD = 'get_card'
      COMMAND_REFRESH_DB = 'refresh_data'
      COMMAND_REPORT_ERROR = 'report_error'

      # Analyzes command received from Slack and decides which data model will handle the process next
      # @param [Hash] params Parameters received from Slack's custom command
      # @return [DSB::Models::Base] Returns a model that is responsible for consuming specific command
      def self.get_model(params)
        if params[:text].length > 0
          words = params[:text].split(' ')
          command = words.first.downcase
        else
          command = COMMAND_REPORT_ERROR
        end

        case command
          when COMMAND_CARD
            return DSB::Models::Card.new(params)
          when COMMAND_REFRESH_DB
            return DSB::Models::RefreshStoredData.new(params)
          when COMMAND_REPORT_ERROR
            return DSB::Models::Error.new(params)
          else
            # Use Card model by default
            return DSB::Models::Card.new(params)
        end

      end

    end
  end
end