module DSB
  module ValueObjects
    class Card < Hash

      def id
        self[:id]
      end

      def id(value)
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

      def rarity(value)
        self[:rarity] = value
      end

      def image_url
        self[:image_url]
      end

      def image_url=(value)
        self[:image_url] = value
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