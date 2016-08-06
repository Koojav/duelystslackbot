require_relative 'base'

module DCG
  module Views
    class RefreshStoredData < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        @value = 'DCG::Views::RefreshStoredData operational.'
      end

    end
  end
end