require_relative 'base'
require './views/refresh_database'

module DCG
  module Models
    class RefreshDatabase < Base

      # Initializes model responsible for refreshing database on user's request
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super
      end

      # Returns view with information about database refresh
      # @return [DCG::Views::RefreshDatabase]
      def view
        DCG::Views::RefreshDatabase.new(params)
      end

    end
  end
end