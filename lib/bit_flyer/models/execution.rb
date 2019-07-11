module BitFlyer
  module Models
    class Execution
      attr_reader :id, :side, :price, :size, :exec_date, :buy_child_order_acceptance_id, :sell_child_order_acceptance_id

      def initialize(attrs = {})
        @id = attrs['id']
        @side = attrs['side']
        @price = attrs['price']
        @size = attrs['size']
        @exec_date = Time.parse(attrs['exec_date']).in_time_zone('Tokyo')
        @buy_child_order_acceptance_id = attrs['buy_child_order_acceptance_id']
        @sell_child_order_acceptance_id = attrs['sell_child_order_acceptance_id']
      end
    end
  end
end