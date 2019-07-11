module BitFlyer
  module Models
    class BalanceHistory
      attr_reader :id,
                  :trade_date,
                  :product_code,
                  :currency_code,
                  :trade_type,
                  :rade_type,
                  :price,
                  :amount,
                  :quantity,
                  :commission,
                  :balance,
                  :order_id

      # trade_type:
      # BUY: 買い
      # SELL: 売り
      # DEPOSIT: 入金・仮想通貨の預入
      # WITHDRAW: 出金・仮想通貨の外部送付
      # FEE: 手数料
      # POST_COLL: 証拠金の預入
      # CANCEL_COLL: 証拠金の引出
      # PAYMENT: ビットコイン決済による仮想通貨の移転
      # TRANSFER: その他の一般的な資金移動

      def initialize(attrs = {})
        @id = attrs['id']
        @trade_date = attrs['trade_date']
        @product_code = attrs['product_code']
        @currency_code = attrs['currency_code']
        @trade_type = attrs['trade_type']
        @price = attrs['price'] # 仮想通貨の取引時の値段(BTCなら1BTCの値段)
        @amount = attrs['amount'] # 取引した値段(日本円等)
        @quantity = attrs['quantity'] # 取引した仮想通貨量
        @commission = attrs['commission'] # 手数料(多分仮装通過の量)
        @balance = attrs['balance'] # 残金(1,0000円入金していて1000円で0.01BTCを買った時→9,000)
        @order_id = attrs['order_id']
      end
    end
  end
end