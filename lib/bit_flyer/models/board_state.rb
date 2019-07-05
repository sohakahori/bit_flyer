module BitFlyer
  module Models
    class BoardState
      attr_reader :health, :state

      def initialize(attrs = {})
        @attrs = attrs
        @health = attrs['health']
        @state = attrs['state']
      end

      def data
        @data ||= @attrs['data'].present? ? BitFlyer::Models::BoardStates::Data.new(@attrs['data']) : nil
      end
    end
  end
end