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
              ID          TEXT  PRIMARY KEY   NOT NULL,
              NAME        TEXT                NOT NULL,
              IMAGE_URL   TEXT
            );')

          db.close
          true
        end

        # Retrieves card info from SQLite database represented by this delegate
        # @param [Hash] params Hash with info based on which query (or anything else) can be constructed to retrieve data
        # @return [Array] of [DSB::ValueObjects::Card]
        def card(params)
          # Check for cards in database
          db = SQLite3::Database.new(DATABASE_PATH)
          stm = db.prepare 'SELECT * FROM CARDS WHERE NAME LIKE ?'
          stm.bind_param 1, "%#{params}%"
          results = stm.execute

          cards = []

          while (row = results.next) do
            card = DSB::ValueObjects::Card.new
            card.name = row[1]
            card.image_url = row[2]
            cards << card
          end

          cards
        end

        # Writes card info to SQLite database represented by this delegate
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def store_cards(cards_array)
          db = SQLite3::Database.new(DATABASE_PATH)

          cards_array.each do |card|

            stm = db.prepare 'REPLACE INTO CARDS(ID, NAME, IMAGE_URL) VALUES(?,?,?)'

            # # TODO: Construct static ID in better way, this is not bad, this is Justin Bieber wrong.
            stm.bind_param 1, "#{card.name}::#{card.image_url}"
            stm.bind_param 2, card.name
            stm.bind_param 3, card.image_url
            stm.execute

          end

        end

      end
    end
  end
end