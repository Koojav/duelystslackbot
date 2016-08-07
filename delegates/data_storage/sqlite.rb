require_relative 'base'
require 'sqlite3'

module DSB
  module Delegates
    module DataStorage

      class SQLite < Base

        DATABASE_PATH = './local_storage/database.sqlite'

        # When creating delegate make sure that database exists with all required tables.
        # If anything is missing from database structure - create it here.
        def initialize
          # TODO: All of this should be executed once per server instancing or just when database is refreshed
          # TODO: Not with every instance of this delegate.

          db = SQLite3::Database.new(DATABASE_PATH)

          # Create table 'CARDS' if it doesn't exist
          db.execute('
            CREATE TABLE IF NOT EXISTS CARDS
            (
              ID          TEXT  PRIMARY KEY   NOT NULL
              NAME        TEXT                NOT NULL,
              IMAGE_URL   TEXT                NOT NULL
            );')

          db.close
          true
        end

        # Retrieves card info from SQLite database represented by this delegate
        # @param [Hash] query Hash with info based on which query (or anything else) can be constructed to retrieve data
        # @return [Array] of [DSB::ValueObjects::Card]
        def card(query)
          card = DSB::ValueObjects::Card.new
          card.name = 'Test SQLite card.'
          card.image_url = 'Test SQLite image_url.'

          [card]
        end

        # Writes card info to SQLite database represented by this delegate
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def store_cards(cards_array)
          cards_array.each do |card|

          end
        end

      end
    end
  end
end