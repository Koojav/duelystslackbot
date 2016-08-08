require_relative 'base'
require 'json'

module DSB
  module Delegates
    module DataStorage

      class JSONFile < Base

        @@file_contents = nil

        FILE_PATH = './local_storage/cards.json'

        # Retrieves card info from JSON file represented by this delegate
        # @param [Hash] query Hash with info based on which query can be constructed to retrieve data
        #   :name
        # @return [Array] of [DSB::ValueObjects::Card]
        def card(query)
          file = File.open(FILE_PATH, File::RDONLY)
          @@file_contents = JSON.parse(file.read, symbolize_names: true)
          file.close

          # Filter cards based on query provided by user
          cards = @@file_contents.select do |card_hash|
            str = card_hash[:name].match(/#{Regexp.escape(query)}/i)

            str != nil
          end

          # Convert simple hashes to class that represents card data
          cards.each_with_index do |card, index|
            cards[index] = DSB::ValueObjects::Card.new(card)
          end

          cards
        end

        # Writes cards info to JSON file represented by this delegate
        # Overwrites content of the file with just the cards that are passed in params.
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def store_cards(cards_array)
          file = File.open('./local_storage/cards.json', File::WRONLY)
          file.write(cards_array.to_json)
          file.close

          @@file_contents = cards_array.to_json
        end

      end

    end
  end
end