require_relative 'base'
require './views/refresh_stored_data'

module DCG
  module Models
    class RefreshStoredData < Base

      # Initializes model responsible for refreshing stored data on user's request
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super
      end

      # Returns view with information about database refresh
      # @return [DCG::Views::RefreshDatabase]
      def view
        DCG::Views::RefreshStoredData.new(params).value
      end

    end
  end
end