require_relative 'base'
require './views/refresh_stored_data'

module DSB
  module Models
    class RefreshStoredData < Base

      # Initializes model responsible for refreshing stored data on user's request
      # @param [DSB::Delegates::Base] delegate_data_acquisition Delegate used to communicate with data acquisition service
      # @param [DSB::Delegates::Base] delegate_data_storage Delegate used to communicate with data storage service
      def initialize(delegate_data_acquisition, delegate_data_storage)
        @delegate_data_acquisition = delegate_data_acquisition
        @delegate_data_storage = delegate_data_storage
        @cards = refresh_stored_data
      end

      # Returns view with information about database refresh
      # @return [DSB::Views::RefreshDatabase]
      def view
        DSB::Views::RefreshStoredData.new(@cards).value
      end

      # Retrieves new dataset from @delegate_data_acquisition and then passes that to be stored via @delegate_data_storage.
      # Delegates on their own have to make sure that resulting dataset won't contain duplicate entries.
      # @return [Array] returns cards that will be in the database after refresh
      def refresh_stored_data
        cards = @delegate_data_acquisition.collect_card_data
        @delegate_data_storage.store_cards(cards)

        cards
      end
      private :refresh_stored_data

    end
  end
end