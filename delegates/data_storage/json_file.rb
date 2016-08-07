require_relative 'base'
require 'json'

module DSB
  module Delegates
    module DataStorage

      class JSONFile < Base

        # Removes all info from JSON file represented by this delegate
        def self.clear_card_data
          file = File.open('./local_storage/cards.json', File::WRONLY)
          file.write('')
          file.close
        end

        # Retrieves card info from JSON file represented by this delegate
        # @param [Hash] query Hash with info based on which query can be constructed to retrieve data
        #   :name
        # @return [Array] of [DSB::ValueObjects::Card]
        def self.card(query)
          # TODO: Cache file after reading its contents

          file = File.open('./local_storage/cards.json', File::RDONLY)
          hash_array = JSON.parse(file.read, symbolize_names: true)
          file.close

          # Filter cards based on query provided by user
          cards = hash_array.select do |card_hash|
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
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def self.store_cards(cards_array)
          file = File.open('./local_storage/cards.json', File::WRONLY)
          file.write(cards_array.to_json)
          file.close
        end

      end

    end
  end
end