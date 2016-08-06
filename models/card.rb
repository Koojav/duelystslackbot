require_relative 'base'
require './views/card'

module DCG
  module Models
    class Card < Base

      # Initializes model responsible for creating data required to display information about a single Duelyst card
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super
      end

      # Returns view of a single Duelyst card
      # @return [DCG::Views::Card]
      def view
        DCG::Views::Card.new(params)
      end

    end
  end
end