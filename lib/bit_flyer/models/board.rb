module BitFlyer
  module Models
    class Board
      attr_reader :mid_price

      def initialize(attrs = {})
        @attrs = attrs
        @mid_price = attrs['mid_price']
      end

      def bids
        @bids ||= @attrs['bids'].map {|bid| BitFlyer::Models::Boards::Bid.new(bid) }
      end
    end
  end
end