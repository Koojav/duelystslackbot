module DSB
  module Delegates
    module DataStorage

      class Base

        # Removes all info from data source represented by delegate
        def self.clear_card_data
          raise 'This needs to be overwritten in derived classes.'
        end

        # Retrieves card info from data source represented by delegate
        # @param [Hash] query Hash with info based on which query (or anything else) can be constructed to retrieve data
        # @return [Array] of [DSB::ValueObjects::Card]
        def self.card(query)
          raise 'This needs to be overwritten in derived classes.'
        end

        # Writes single card info to data source represented by delegate
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def self.store_cards(cards_array)
          raise 'This needs to be overwritten in derived classes.'
        end

      end

    end
  end
end