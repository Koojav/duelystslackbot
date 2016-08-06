require_relative 'base'

module DCG
  module Delegates
    module DataStorage

      class JSONFile < Base

        # Removes all info from JSON file represented by this delegate
        def self.clear_card_data
          f = File.open('./local_storage/cards.json','w')
          f.write('')
          f.close
        end

        # Retrieves card info from JSON file represented by this delegate
        # @param [Hash] query Hash with info based on which query can be constructed to retrieve data
        # @return [Array] of [DCG::ValueObjects::Card]
        def self.card(query)
          #TODO
        end

        # Writes cards info to JSON file represented by this delegate
        # @param [Array] cards_array An array of [DCG::ValueObjects::Card] that are about to be stored
        def self.store_cards(cards_array)
          #TODO
        end



      end

    end
  end
end