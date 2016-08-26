require './views/base'
require 'json'

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
            response[:text] = ':desert: No cards found in database.'
          elsif cards.length == 1

            if cards[0][:image_url]
              response[:text] = ''
              response[:text] << "> *Card:*    *#{cards[0].name}*              #{cards[0].faction}  |  #{cards[0].rarity}  |  #{cards[0].type}\n"
              response[:text] << "> *Stats:*   #{cards[0].attack}  /  #{cards[0].health}\n"
              response[:text] << "> *Cost:*    #{cards[0].mana_cost}\n"
              response[:text] << "> *Desc:*    #{cards[0].description}\n"
              response[:text] << "> *Image:*   #{cards[0].image_url}\n"
            end

          elsif cards.length < 10
            response[:text] = "Results:\n"

            cards.each_with_index do |card, index|
              response[:text] << "> #{index+1}. #{card.name}  |  #{card.type}  |  #{card.rarity}\n"
            end

          else

            response[:text] = 'Ocean of results. Could you be a little bit more _pacific_? (Get it? P A C I F I C    O C E A N. Duh.)'
          end

          @value = response.to_json
        end

      end
    end
  end
end