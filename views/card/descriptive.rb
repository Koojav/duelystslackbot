require './views/base'
require 'json'
require_relative 'responses'

module DSB
  module Views
    module Card
      class Descriptive < Base

        # Build the view based on params, cache it and return at the end
        # @param [Array] cards of [DSB::ValueObjects::Card]
        def initialize(cards)
          response = {}
          response[:response_type] = 'in_channel'

          if cards.length == 0
            response[:text] = DSB::Views::Card::Responses.no_cards
          elsif cards.length == 1
            response[:text] = DSB::Views::Card::Responses.single_card(cards[0])
          elsif cards.length < 10
            response[:text] = DSB::Views::Card::Responses.multiple_cards(cards)
          else
            response[:text] = DSB::Views::Card::Responses.too_many_cards
          end

          @value = response.to_json
        end

      end
    end
  end
end