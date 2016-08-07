require_relative 'base'

module DSB
  module Views
    class Error < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        @value = 'DSB::Views::Error operational.'
      end

    end
  end
end