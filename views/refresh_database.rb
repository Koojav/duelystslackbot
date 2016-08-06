require_relative 'base'

module DCG
  module Views
    class RefreshDatabase < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        @value = 'DCG::Views::RefreshDatabase operational.'
      end

    end
  end
end