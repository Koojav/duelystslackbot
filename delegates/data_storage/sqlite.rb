require_relative 'base'

module DCG
  module Delegates
    module DataStorage

      class SQLite < Base

        # Removes all info from SQLite database represented by this delegate
        def self.clear_card_data
          # TODO
        end

        # Retrieves card info from SQLite database represented by this delegate
        # @param [Hash] query Hash with info based on which query (or anything else) can be constructed to retrieve data
        # @return [Array] of [DCG::ValueObjects::Card]
        def self.card(query)
          #TODO
        end

        # Writes card info to SQLite database represented by this delegate
        # @param [Array] cards_array An array of [DCG::ValueObjects::Card] that are about to be stored
        def self.store_cards(cards_array)
          #TODO
        end

      end
    end
  end
end