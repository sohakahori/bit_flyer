module BitFlyer
  module Models
    class Market
      attr_reader :product_code, :alias
      def initialize(attrs = {})
        @product_code = attrs['product_code']
        @alias = attrs['alias'].present? ? attrs['alias'] : nil
      end
    end
  end
end