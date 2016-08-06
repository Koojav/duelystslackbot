require '../delegates/data_storage/json_file'

module DCG
  module Controllers
    class CardData

      attr_reader :storage_delegate
      attr_reader :acquisition_delegate

      def initialize
        @acquisition_delegate = DCG::Delegates::DataAcquisition::DuelystDB.new
        @storage_delegate = DCG::Delegates::DataStorage::JSONFile.new
      end

      # Retrieves data about all cards from storage described by @acquisition_delegate
      def collect_card_data
        @acquisition_delegate.collect_card_data
      end
      private :collect_card_data

      # Removes all info about cards from storage described by @storage_delegate
      def clear_card_data
        @storage_delegate.clear_card_data
      end

      # Retrieves card info from storage described by @storage_delegate
      # @return [DCG::ValueObjects::Card]
      def card
        @storage_delegate.card
      end

      # Writes card info to storage described by @storage_delegate
      # @param [DCG::ValueObjects::Card] card
      def card=(card)
        @storage_delegate.card = card
      end

    end
  end
end