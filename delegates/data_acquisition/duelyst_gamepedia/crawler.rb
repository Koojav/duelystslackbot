require './value_objects/card'
require 'open-uri'


module DSB
  module Delegates
    module DataAcquisition
      module DuelystGamepedia

        class Crawler

          DOMAIN = 'http://duelyst.gamepedia.com'

          # Analyzes Gamepedia with all cards and retrieves them in form of an array
          # @return [Array] of [DSB::ValueObjects::Card]
          def self.crawl

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
                # puts "Added: #{card.image_url}"
              end

              cards << card
            end

            cards
          end

        end
      end
    end
  end
end