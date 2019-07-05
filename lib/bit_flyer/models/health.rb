module BitFlyer
  module Models
    class Health
      attr_reader :status

      def initialize(attrs = {})
        @status = attrs['status']
      end
    end
  end
end