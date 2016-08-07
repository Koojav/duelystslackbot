require_relative '../base'
require_relative 'crawler'

module DSB
  module Delegates
    module DataAcquisition
      module DuelystGamepedia

        class DuelystGamepedia < DSB::Delegates::DataAcquisition::Base

          # Retrieves from DuelystDB about all cards in game and returns them as an array
          # @return [Array] of [DSB::ValueObjects::Card]
          def collect_card_data
            Crawler.crawl
          end

        end
      end
    end
  end
end