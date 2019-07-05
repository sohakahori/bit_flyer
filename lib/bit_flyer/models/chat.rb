module BitFlyer
  module Models
    class Chat
      attr_reader :nickname, :message, :date

      def initialize(attrs = {})
        @nickname = attrs['nickname']
        @message = attrs['message']
        @date = attrs['date']
      end
    end
  end
end