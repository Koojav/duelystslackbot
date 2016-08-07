require_relative 'base'
require 'json'

module DSB
  module Views
    class Card < Base

      # Build the view based on params, cache it and return at the end
      # @param [Array] cards of [DSB::ValueObjects::Card]
      def initialize(cards)
        response = {}
        response[:response_type] = 'in_channel'

        if cards.length == 1
          if cards[0][:image_url]
            response[:text] = cards[0][:image_url]
          else
            response[:text] = ':desert: Unfortunately this card has no image available.'
          end

        else
          response[:text] = "Results: #{cards.length}"
        end

        @value = response.to_json
      end

    end
  end
end