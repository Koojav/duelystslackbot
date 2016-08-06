require_relative 'base'
require './views/card'
require './delegates/data_storage/json_file'

module DCG
  module Models
    class Card < Base

      # Initializes model responsible for creating data required to display information about a single Duelyst card
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super

        @cards = DCG::Delegates::DataStorage::JSONFile.card(params[:text])
      end

      # Returns view of a search results for a Duelyst card
      # @return [DCG::Views::Card]
      def view
        DCG::Views::Card.new(@cards).value
      end

    end
  end
end