require './value_objects/card'
require 'open-uri'


module DSB
  module Delegates
    module DataAcquisition
      module DuelystGamepedia

        class Crawler

          DOMAIN = 'http://duelyst.gamepedia.com'

          # SLOW:
          # Analyzes http://duelyst.gamepedia.com/Cards and follows links (3 levels) to get best possible card image
          # @return [Array] of [DSB::ValueObjects::Card]
          def self.crawl_method_slow

            source = open('http://duelyst.gamepedia.com/Cards').read
            rows = source.scan(/<tr>\n<td>.*?<\/tr>/m)
            cards = []

            rows.each do |row|
              # There are some cards listed but without wiki-page created for them - omitting those for now
              if row.match(/page does not exist/)
                next
              end

              # Create new card to store data scrapped from websites
              card = DSB::ValueObjects::Card.new

              card.name = row.scan(/(title=")(.*?)(")/)[0][1]

              # Find URL to the details of the card in currently analyzed row
              card_details_url = row.scan(/a href="(.*?)"/)[0][0]

              # Retrieve card details' source
              card_details_source = open(DOMAIN + card_details_url).read

              # In card details source try to find image representing link to the site where image actually is (...)
              begin
                card_image_versions_url = card_details_source.scan(/(<a href=")(.*?)(" class="image")/)[0][1]
              rescue Exception => e
                # There is no image of the card in Card details
                nil
              else
                # Image is present in card details so we need to go one level deeper and open the site with
                # versions of images
                card_image_versions_source = open(DOMAIN + card_image_versions_url).read

                # If everything went fine we should be on image's versions and just need to find the latest one
                card.image_url = card_image_versions_source.scan(/fullImageLink.*?a href="(.*?)"/)[0][0]
                puts "Added: #{card.image_url}"
              end

              cards << card
            end

            puts "Total: #{cards.length}"
            cards
          end

          ARMY_URLS = [
              'http://duelyst.gamepedia.com/Lyonar_Kingdom',
              'http://duelyst.gamepedia.com/Songhai',
              'http://duelyst.gamepedia.com/Vetruvian',
              'http://duelyst.gamepedia.com/Abyssian',
              'http://duelyst.gamepedia.com/Magmar',
              'http://duelyst.gamepedia.com/Vanar',
              'http://duelyst.gamepedia.com/Neutral',
          ]

          # FAST:
          # Analyzes http://duelyst.gamepedia.com/{ARMY_NAME}, gets biggest thumbnail as image
          # Doesn't open any additional links
          # @return [Array] of [DSB::ValueObjects::Card]
          def self.crawl_method_fast

            cards = []

            ARMY_URLS.each do |army_url|
              source = open(army_url).read
              rows = source.scan(/<tr>\n<td>[ ]*<a href.*?<\/tr>/m)

              rows.each do |row|
                # Create new card to store data scrapped from websites

                cells = row.scan(/<td>.*?<\/td>/m)

                # Sanitize cell code so it matches common pattern
                cells.each do |cell|
                  cell.gsub!(/\n/, '')
                  cell.gsub!(/<p>/, '')
                  cell.gsub!(/<\/p>/, '')
                end

                begin
                  card = DSB::ValueObjects::Card.new
                  card.image_url  = cells[0].scan(/ (https:\/\/.*?)(2x)/)[0][0]
                  card.name       = cells[1].scan(/(>[ ]*)(.*?)([ ]*<)/)[0][1]

                  if cells[2].downcase.include? 'general'
                    card.type       = cells[2].scan(/(>[ ]*)(.*?)([ ]*<)/)[0][1]
                  else
                    card.rarity     = cells[2].scan(/(>[ ]*)([a-zA-Z]*?)([ ]*<\/td>)/)[0][1]
                    card.type       = cells[3].scan(/(>[ ]*)(.*?)([ ]*<)/)[0][1]
                  end

                  card.id =  "#{card.name}::#{card.type}"

                rescue Exception => e
                  nil
                else
                  cards << card
                end

              end
            end

            cards
          end

        end
      end
    end
  end
end
