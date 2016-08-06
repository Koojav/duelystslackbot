require './value_objects/card'
require 'net/http'


module DCG
  module Delegates
    module DataAcquisition
      module DuelystDB

        class Crawler

          # Analyzes DuelystDB website with all cards and retrieves them in form of an array
          # @return [Array] of [DCG::ValueObjects::Card]
          def self.crawl
            # TODO
            source = Net::HTTP.get('duelystdb.com', '/card/all')
            source
          end

        end
      end
    end
  end
end