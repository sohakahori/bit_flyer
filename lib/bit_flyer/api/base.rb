module BitFlyer
  module Api
    class Base
      require 'faraday'
      BASE_URL = "https://api.bitflyer.com"

      private
      def connect
        @connect ||= Faraday.new(:url => BitFlyer::Api::Base::BASE_URL) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end