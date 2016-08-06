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
        # @return [DCG::ValueObjects::Card]
        def self.card
          # TODO
        end

        # Writes card info to SQLite database represented by this delegate
        # @param [DCG::ValueObjects::Card] card
        def self.card=(card)
          # TODO
        end

      end
    end
  end
end