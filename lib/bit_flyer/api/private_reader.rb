module BitFlyer
  module Api
    class PrivateReader < BitFlyer::Api::Base
      require "openssl"
      require "uri"
      require 'active_support/core_ext'

      CURRENCY_CODE = 'JPY'

      def initialize(key, secret)
        @key = key
        @secret = secret
      end


      # 約定の一覧を取得
      # パラメータ
      # product_code: マーケットの一覧で取得できる product_code または alias のいずれかを指定してください。
      # count, before, after: ページ形式 を参照してください。
      def executions(product_code = '', count = nil, before = nil, after = nil)
        timestamp = Time.now.to_i.to_s
        uri = URI.parse(BASE_URL)
        uri.path = "/v1/me/getexecutions"
        query_string = {}
        query_string[:product_code] = product_code if product_code.present?
        query_string[:count] = count if count.present?
        query_string[:before] = before unless before.nil?
        query_string[:after] = after unless after.nil?
        uri.query = query_string.to_param
        uri_path = query_string.count >= 1 ? uri.request_uri : uri.path

        text = timestamp + 'GET' + uri_path
        sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @secret, text)

        response = connect.get do |req|
          req.url uri_path
          req.headers = {
            "ACCESS-KEY" => @key,
            "ACCESS-TIMESTAMP" => timestamp,
            "ACCESS-SIGN" => sign
          }
        end
        response.body
      end

      # 残高履歴
      def balancehistory(count = 100, before = nil, after = nil)
        timestamp = Time.now.to_i.to_s
        uri = URI.parse(BASE_URL)
        uri.path = "/v1/me/getbalancehistory"
        query_string = {}
        query_string[:currency_code] = CURRENCY_CODE
        query_string[:count] = count if count.present?
        query_string[:before] = before unless before.nil?
        query_string[:after] = after unless after.nil?
        uri.query = query_string.to_param
        request_uri = uri.request_uri

        text = timestamp + 'GET' + request_uri
        sign = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @secret, text)

        response = connect.get do |req|
          req.url request_uri
          req.headers = {
            "ACCESS-KEY" => @key,
            "ACCESS-TIMESTAMP" => timestamp,
            "ACCESS-SIGN" => sign
          }
        end
        response.body
      end
    end
  end
end
