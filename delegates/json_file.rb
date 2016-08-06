require_relative 'base'

module DCG
  module Delegates
    class JSONFile < Base

      # Removes all info from JSON file represented by this delegate
      def clear_card_data
        # TODO
      end

      # Retrieves card info from JSON file represented by this delegate
      # @return [DCG::ValueObjects::Card]
      def card
        # TODO
      end

      # Writes card info to JSON file represented by this delegate
      # @param [DCG::ValueObjects::Card] card
      def card=(card)
        # TODO
      end

    end
  end
end