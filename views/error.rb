require_relative 'base'

module DSB
  module Views
    class Error < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        @value = ':desert: Parameters not recognized. Please practice on _Tupperware Shape O Sorter_.'
      end

    end
  end
end