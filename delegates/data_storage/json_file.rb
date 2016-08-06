require_relative 'base'

module DCG
  module Delegates
    module DataStorage

      class JSONFile < Base

        # Removes all info from JSON file represented by this delegate
        def self.clear_card_data
          # TODO
        end

        # Retrieves card info from JSON file represented by this delegate
        # @return [DCG::ValueObjects::Card]
        def self.card
          # TODO
        end

        # Writes card info to JSON file represented by this delegate
        # @param [DCG::ValueObjects::Card] card
        def self.card=(card)
          # TODO
        end

      end

    end
  end
end