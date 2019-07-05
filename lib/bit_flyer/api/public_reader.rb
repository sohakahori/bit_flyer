module BitFlyer
  module Api
    class PublicReader < BitFlyer::Api::Base
        require 'active_support/all'

      # マーケットの一覧
      def market
        conn = connect
        response = conn.get '/v1/markets'
        response.body
      end

      # チャット
      def chats(from_date = nil)
        conn = connect
        from_date = from_date.to_date unless from_date.nil?
        response = conn.get '/v1/getchats', {from_date: from_date}
        response.body
      end

      # 板情報
      def board(product_code = '')
        conn = connect
        params = {}
        params[:product_code] = product_code if product_code.present?
        response = conn.get '/v1/board', params
        response.body
      end

      # Ticker
      def ticker(product_code = '')
        conn = connect
        params = {}
        params[:product_code] = product_code if product_code.present?
        response = conn.get '/v1/ticker', params
        response.body
      end

      # 約定履歴
      def executions(count = 100, before = nil, after = nil)
        conn = connect
        params = {}
        params[:count] = count if count.present?
        params[:before] = before unless before.nil?
        params[:after] = after unless before.nil?
        response = conn.get '/v1/executions', params
        response.body
      end

      # 板の状態
      #
      # health: 取引所の稼動状態です。以下のいずれかの値をとります。
      # NORMAL: 取引所は稼動しています。
      # BUSY: 取引所に負荷がかかっている状態です。
      # VERY BUSY: 取引所の負荷が大きい状態です。
      # SUPER BUSY: 負荷が非常に大きい状態です。発注は失敗するか、遅れて処理される可能性があります。
      # NO ORDER: 発注が受付できない状態です。
      # STOP: 取引所は停止しています。発注は受付されません。
      #
      # state: 板の状態です。以下の値をとります。
      # RUNNING: 通常稼働中
      # CLOSED: 取引停止中
      # STARTING: 再起動中
      # PREOPEN: 板寄せ中
      # CIRCUIT BREAK: サーキットブレイク発動中
      # AWAITING SQ: Lightning Futures の取引終了後 SQ（清算値）の確定前
      # MATURED: Lightning Futures の満期に到達
      # data.rb: 板の状態について、付加情報を提供します。
      # special_quotation: Lightning Futures の SQ（清算値）
      def board_state(product_code = '')
        conn = connect
        params = {}
        params[:product_code] = product_code if product_code.present?
        response = conn.get '/v1/getboardstate', params
        response.body
      end

      # 取引所の状態
      # NORMAL: 取引所は稼動しています。
      # BUSY: 取引所に負荷がかかっている状態です。
      # VERY BUSY: 取引所の負荷が大きい状態です。
      # SUPER BUSY: 負荷が非常に大きい状態です。発注は失敗するか、遅れて処理される可能性があります。
      # NO ORDER: 発注が受付できない状態です。
      # STOP: 取引所は停止しています。発注は受付されません。
      def health(product_code = '')
        conn = connect
        params = {}
        params[:product_code] = product_code if product_code.present?
        response = conn.get '/v1/gethealth', params
        response.body
      end
    end
  end
end
