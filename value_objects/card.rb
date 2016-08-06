module DCG
  module ValueObjects
    class Card < Hash

      def name
        self[:name]
      end

      def name=(value)
        self[:name] = value
      end

      def image_url
        self[:image_url]
        end

      def image_url=(value)
        self[:image_url] = value
      end

    end
  end
end