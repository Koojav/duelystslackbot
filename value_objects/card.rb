module DSB
  module ValueObjects
    class Card < Hash

      def id
        self[:id]
      end

      def id=(value)
        self[:id] = value
      end

      def name
        self[:name]
      end

      def name=(value)
        self[:name] = value
      end

      def rarity
        self[:rarity]
      end

      def rarity=(value)
        self[:rarity] = value
      end

      def image_url
        self[:image_url]
      end

      def image_url=(value)
        self[:image_url] = value
      end

      def type
        self[:type]
      end

      def type=(value)
        self[:type] = value
      end

      def description
        self[:description]
      end

      def description=(value)
        self[:description] = value
      end

      def attack
        self[:attack]
      end

      def attack=(value)
        self[:attack] = value
      end

      def health
        self[:health]
      end

      def health=(value)
        self[:health] = value
      end

      def mana_cost
        self[:mana_cost]
      end

      def mana_cost=(value)
        self[:mana_cost] = value
      end

      def faction
        self[:faction]
      end

      def faction=(value)
        self[:faction] = value
      end

      def initialize(hash = nil)
        if hash
          hash.each do |key, value|
            self[key] = value
          end
        end
      end

    end
  end
end