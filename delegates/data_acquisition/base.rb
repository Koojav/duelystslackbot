module DSB
  module Delegates
    module DataAcquisition

      class Base

        # Retrieves from external source data about all cards in game and returns them as an array
        # @return [Array] of [DSB::ValueObjects::Card]
        def self.collect_card_data
          raise 'This needs to be overwritten in derived classes.'
        end

      end

    end
  end
end