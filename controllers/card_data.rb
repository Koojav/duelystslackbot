require '../delegates/data_storage/json_file'

module DCG
  module Controllers
    class CardData

      attr_reader :storage_delegate
      attr_reader :acqusition_delegate

      def initialize
        @storage_delegate = DCG::Delegates::DataStorage::JSONFile.new
      end

      # Removes all info about cards from local storage
      def clear_card_data
        @storage_delegate.clear_card_data
      end

      # Retrieves card info from local storage
      # @return [DCG::ValueObjects::Card]
      def card
        @storage_delegate.card
      end

      # Writes card info to local storage
      # @param [DCG::ValueObjects::Card] card
      def card=(card)
        @storage_delegate.card = card
      end

    end
  end
end