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

          # TODO: All of this should be executed once per server instancing or just when database is refreshed. Not with every instance of this delegate.
          db = SQLite3::Database.new(DATABASE_PATH)

          # Create table 'CARDS' if it doesn't exist
          db.execute('
            CREATE TABLE IF NOT EXISTS CARDS
            (
              ID          TEXT  PRIMARY KEY   NOT NULL,
              NAME        TEXT                NOT NULL,
              RARITY      TEXT,
              TYPE        TEXT,
              IMAGE_URL   TEXT,
              DESCRIPTION TEXT,
              FACTION     TEXT,
              ATTACK      INT,
              HEALTH      INT,
              MANA_COST   INT
            );')

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
            card.name         = row[1]
            card.rarity       = row[2]
            card.type         = row[3]
            card.image_url    = row[4]
            card.description  = row[5]
            card.faction      = row[6]
            card.attack       = row[7]
            card.health       = row[8]
            card.mana_cost    = row[9]
            cards << card
          end

          cards
        end

        # Writes card info to SQLite database represented by this delegate
        # @param [Array] cards_array An array of [DSB::ValueObjects::Card] that are about to be stored
        def store_cards(cards_array)
          db = SQLite3::Database.new(DATABASE_PATH)

          db.transaction
          cards_array.each do |card|

            db.execute('REPLACE INTO CARDS(ID, NAME, RARITY, TYPE, IMAGE_URL, DESCRIPTION, FACTION, ATTACK, HEALTH, MANA_COST) VALUES(?,?,?,?,?,?,?,?,?,?)',
                       [card.id, card.name, card.rarity, card.type, card.image_url, card.description, card.faction, card.attack, card.health, card.mana_cost])

          end
          db.commit

        end

      end
    end
  end
end