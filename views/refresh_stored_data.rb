require_relative 'base'

module DSB
  module Views
    class RefreshStoredData < Base

      # Build the view based on params, cache it and return at the end
      # @param [Array] cards All cards that have been added to the database in result of last refresh.
      def initialize(cards)
        @value = "DSB::Views::RefreshStoredData operational. Cards amount: #{cards.size}"
      end

    end
  end
end