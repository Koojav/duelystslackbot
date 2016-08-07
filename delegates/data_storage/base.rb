module DSB
  module Delegates
    module DataStorage

      class Base

        # Retrieves card info from data source represented by delegate
        # @param [Hash] query Hash with info based on which query (or anything else) can be constructed to retrieve data
        # @return [Array] of [DSB::ValueObjects::Card]
        def card(query)
          raise 'This needs to be overwritten in derived classes.'
        end

        # Writes cards' info to data source represented by delegate
        # Process of adding data should not result in duplicate card entries
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def store_cards(cards_array)
          raise 'This needs to be overwritten in derived classes.'
        end

      end

    end
  end
end