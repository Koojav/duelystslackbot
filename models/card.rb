require_relative 'base'
require './views/card'
require './delegates/data_storage/json_file'

module DSB
  module Models
    class Card < Base

      # Initializes model responsible for creating data required to display information about a single Duelyst card
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super

        @cards = DSB::Delegates::DataStorage::JSONFile.card(params[:text])
      end

      # Returns view of a search results for a Duelyst card
      # @return [DSB::Views::Card]
      def view
        DSB::Views::Card.new(@cards).value
      end

    end
  end
end