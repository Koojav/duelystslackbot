require_relative 'base'
require './utils/commands'

module DSB
  module Views
    class Error < Base

      # Build view responsible for reporting command errors
      def initialize(params)

        case params[:command]
          when DSB::Utils::Commands::REFRESH_DATA
            @value = ':desert: Insufficient permissions - please check configuration file. '
          else
            @value = ':desert: Invalid parameters.'
        end

      end

    end
  end
end