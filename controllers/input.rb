require './models/card'
require './models/refresh_database'
require './models/error'

module DCG
  module Controllers
    class InputController

      # List of commands bot will operate on
      # Add more commands here to extend bot's functionality
      # Commands cannot contain spaces
      COMMAND_CARD = 'card'
      COMMAND_REFRESH_DB = 'refresh_database'
      COMMAND_REPORT_ERROR = 'report_error'

      # Analyzes command received from Slack and decides which data model will handle the process next
      # @param [Hash] params Parameters received from Slack's custom command
      # @return [DCG::Models::Base] Returns a model that is responsible for consuming specific command
      def self.get_model(params)
        begin
          words = params[:text].split(' ')
          command = words.first.downcase
        rescue Exception => e
          command = COMMAND_REPORT_ERROR
        end

        case command
          when COMMAND_CARD
            return DCG::Models::Card.new(params)
          when COMMAND_REFRESH_DB
            return DCG::Models::RefreshDatabase.new(params)
          when COMMAND_REPORT_ERROR
            return DCG::Models::Error.new(params)
          else
            # Use Card model by default
            return DCG::Models::Card.new(params)
        end

      end

    end
  end
end