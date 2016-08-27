require_relative '../base'
require 'open-uri'
require './value_objects/card'

module DSB
  module Delegates
    module DataAcquisition
      module DuelystDb

        class DuelystDb < DSB::Delegates::DataAcquisition::Base

          URL_ALL_CARDS_JSON = 'http://duelystdb.com/card/all.json?enabled=1'

          # Retrieves from DuelystDB about all cards in game and returns them as an array
          # @return [Array] of [DSB::ValueObjects::Card]
          def collect_card_data

            rarities      = ['Base','Common','Rare','Epic','Legendary']
            factions      = ['','Lyonar','Songhai','Vetruvian','Abyssian','Magmar','Vanar']
            factions[100] = 'Neutral'

            cards = []

            cards_hash = JSON.parse(open(URL_ALL_CARDS_JSON).read, symbolize_names: true)
            cards_hash.each do |card_hash|

              # Omit cards from tutorial
              if card_hash[:faction_id] == '200'
                next
              end

              card = DSB::ValueObjects::Card.new
              card.id           = card_hash[:duelyst_id]
              card.type         = card_hash[:type]
              card.name         = card_hash[:label]
              card.image_url    = card_hash[:image]
              card.rarity       = rarities[card_hash[:rarity].to_i]
              card.faction      = factions[card_hash[:faction_id].to_i]
              card.description  = card_hash[:description]
              card.attack       = card_hash[:attack]
              card.health       = card_hash[:health]
              card.mana_cost    = card_hash[:mana_cost]

              cards << card
            end

            cards
          end

        end
      end
    end
  end
end