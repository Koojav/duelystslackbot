module DSB
  module Views
    class Base

      attr_reader :value

      # Base initializer for all views
      # All views need to create it's representation based on params passed and store them in @value
      # which has to be returned at the end
      def initialize(params)
        @value = 'Exemplary use of a view.'
      end

    end
  end
end