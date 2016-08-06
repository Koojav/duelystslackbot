require_relative 'base'

module DCG
  module Views
    class Card < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        @value = 'DCG::Views::Card operational.'
      end

    end
  end
end