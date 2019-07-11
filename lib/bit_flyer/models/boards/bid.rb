module BitFlyer
  module Models
    module Boards
      class Bid
        attr_reader :price, :size

        def initialize(params)
          @price = params['price']
          @size = params['size']
        end
      end
    end
  end
end