require_relative 'base'
require 'json'

module DCG
  module Views
    class Card < Base

      # Build the view based on params, cache it and return at the end
      def initialize(params)
        response = {}
        response[:response_type] = 'in_channel'
        response[:text] = 'DCG::Views::Card operational.'

        @value = response.to_json
      end

    end
  end
end