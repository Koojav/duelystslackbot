module DCG
  module Controllers
    class CardData

      attr_reader :delegate

      def initialize
        @delegate = DCG::Delegates::JSONFile.new
      end

      # Removes all info about cards
      def clear_card_data
        @delegate.clear_card_data
      end

      # Retrieves card info
      # @return [DCG::ValueObjects::Card]
      def card
        @delegate.card
      end

      # Writes card info
      # @param [DCG::ValueObjects::Card] card
      def card=(card)
        @delegate.card = card
      end

    end
  end
end