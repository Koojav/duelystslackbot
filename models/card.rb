require_relative 'base'
require './views/card/image'
require './views/card/descriptive'

module DSB
  module Models
    class Card < Base

      # Initializes model responsible for creating data required to display information about a single Duelyst card
      # @param [Hash] params Input data required to generate specific model
      def initialize(params, delegate_data_storage)
        @delegate_data_storage = delegate_data_storage
        @cards = @delegate_data_storage.card(params[:text])
      end

      # Returns view of a search results for a Duelyst card
      def view
        DSB::Views::Card::Descriptive.new(@cards).value
      end

    end
  end
end