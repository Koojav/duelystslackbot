require_relative '../base'
require_relative 'crawler'

module DSB
  module Delegates
    module DataAcquisition
      module DuelystGamepedia

        class DuelystGamepedia < DSB::Delegates::DataAcquisition::Base

          # Retrieves from Duelyst Gamepedia about all cards in game and returns them as an array
          # @return [Array] of [DSB::ValueObjects::Card]
          def collect_card_data
            Crawler.crawl_method_fast
          end

        end
      end
    end
  end
end