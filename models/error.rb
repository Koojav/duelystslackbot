require_relative 'base'
require './views/error'

module DCG
  module Models
    class Error < Base

      # Initializes model responsible for reporting an error with user's request
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super
      end

      # Returns view with error representation
      # @return [DCG::Views::Error]
      def view
        DCG::Views::Error.new(params).value
      end

    end
  end
end