module BitFlyer
  module Models
    class Ticker
      attr_reader :product_code,
                  :timestamp,
                  :tick_id,
                  :best_bid,
                  :best_ask,
                  :best_bid_size,
                  :best_ask_size,
                  :total_bid_depth,
                  :total_ask_depth,
                  :ltp,    # 最終取引価格
                  :volume, # volume
                  :volume_by_product

      def initialize(attrs = {})
        @product_code = attrs['product_code']
        @timestamp = Time.parse(attrs['timestamp']).in_time_zone('Tokyo')
        @tick_id = attrs['tick_id']
        @best_bid = attrs['best_bid']
        @best_ask = attrs['best_ask']
        @best_bid_size = attrs['best_bid_size']
        @best_ask_size = attrs['best_ask_size']
        @total_bid_depth = attrs['total_bid_depth']
        @total_ask_depth = attrs['total_ask_depth']
        @ltp = attrs['ltp']
        @volume = attrs['volume']
        @volume_by_product = attrs['volume_by_product']
      end
    end
  end
end