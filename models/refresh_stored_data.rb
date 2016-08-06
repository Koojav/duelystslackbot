require_relative 'base'
require './views/refresh_stored_data'

module DCG
  module Models
    class RefreshStoredData < Base

      # Initializes model responsible for refreshing stored data on user's request
      # @param [Hash] params Input data required to generate specific model
      def initialize(params)
        super
        @cards = refresh_stored_data
      end

      # Returns view with information about database refresh
      # @return [DCG::Views::RefreshDatabase]
      def view
        DCG::Views::RefreshStoredData.new(@cards).value
      end

      # Clears stored card data and retrieves new set from external source
      # Unless source returned zero results then previous set will remain
      # @return [Array] returns cards that will be in the database after refresh
      def refresh_stored_data
        cards = DCG::Delegates::DataAcquisition::DuelystGamepedia::DuelystGamepedia.collect_card_data

        if cards.length > 0
          DCG::Delegates::DataStorage::JSONFile.clear_card_data
          DCG::Delegates::DataStorage::JSONFile.store_cards(cards)
        end

        cards
      end
      private :refresh_stored_data

    end
  end
end