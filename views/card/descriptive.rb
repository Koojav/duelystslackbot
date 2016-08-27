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

            card = cards[0]
              response[:text] = ''
              response[:text] << "> *Card:*    *#{card.name}*                #{card.faction}  |  #{card.type}  |  #{card.rarity}\n"

              if card.type != 'Spell' && card.type != 'Artifact'
                response[:text] << "> *Stats:*   #{card.attack}  /  #{card.health}\n"
              end

              response[:text] << "> *Cost:*    #{card.mana_cost}\n"
              response[:text] << "> *Desc:*    #{card.description.gsub('<b>','*').gsub('</b>','*').gsub('<br>',' ')}\n"
              response[:text] << "> *Image:*   #{card.image_url}\n"

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