module DSB
  module Models
    class Base

      attr_reader :params

      # Returns final version of data that will be passed to browser (or any other client)
      # which's request has resulted in creating this model.
      # @return [DSB::Views::Base]
      def view
        raise 'This needs to be overwritten in derived classes.'
      end

    end
  end
end