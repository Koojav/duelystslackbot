require './utils/config'

module DSB
  module Views
    module Card
      class Responses

        def self.emojis
          @@emojis ||= DSB::Utils::Config.get[:application_settings][:emojis]
        end

        def self.no_cards
            ':desert: No cards found in database.'
        end

        # Response for descriptive result with one card
        # @param [DSB::ValueObject::Card] card Card which is about to be presented in the view
        # @return [String] text of the response
        def self.single_card(card)

          if emojis["rarity_#{card.rarity.downcase}".to_sym] != ''
            rarity = emojis["rarity_#{card.rarity.downcase}".to_sym]
          else
            rarity = card.rarity
          end

          text = ''
          text << "> *Card:*    *#{card.name}*                #{card.faction}  |  #{card.type}  |  #{rarity}\n"

          if card.type != 'Spell' && card.type != 'Artifact'
            text << "> *Stats:*   #{card.attack}  /  #{card.health}\n"
          end

          text << "> *Cost:*    #{card.mana_cost}\n"
          text << "> *Desc:*    #{card.description.gsub('<b>','*').gsub('</b>','*').gsub('<br>',' ')}\n"
          text << "> *Image:*   #{card.image_url}\n"
        end

        # Response for multiple card list
        # @param [Array] cards Array of [DSB::ValueObject::Card] to be displayed in the view
        # @return [String] text of the response
        def self.multiple_cards(cards)
          response[:text] = "Results:\n"

          cards.each_with_index do |card, index|
            rarity = emojify ? emojis["rarity_#{card.rarity.downcase}".to_sym] : card.rarity
            response[:text] << "> #{index+1}. #{card.name}  |  #{card.type}  |  #{rarity}\n"
          end
        end

        def self.too_many_cards
          'Ocean of results. Could you be a little bit more _pacific_? (Get it? P A C I F I C    O C E A N. Duh.)'
        end

      end
    end
  end
end