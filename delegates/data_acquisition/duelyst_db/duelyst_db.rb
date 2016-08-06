require_relative '../base'
require_relative 'crawler'

module DCG
  module Delegates
    module DataAcquisition
      module DuelystDB

        class DuelystDB < DCG::Delegates::DataAcquisition::Base

          # Retrieves from DuelystDB about all cards in game and returns them as an array
          # @return [Array] of [DCG::ValueObjects::Card]
          def self.collect_card_data
            Crawler.crawl
          end

        end
      end
    end
  end
end