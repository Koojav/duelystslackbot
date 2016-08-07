require_relative 'base'
require './views/error'

module DSB
  module Models
    class Error < Base

      # Initializes model responsible for reporting an error with user's request
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        @params = params
      end

      # Returns view with error representation
      # @return [DSB::Views::Error]
      def view
        DSB::Views::Error.new(@params).value
      end

    end
  end
end