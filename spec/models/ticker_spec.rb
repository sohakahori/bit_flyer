RSpec.describe BitFlyer::Models::Ticker do
  describe '#initialize' do
    before do
      file_path = File.expand_path('../../tmp/ticker.json', __FILE__ )
      file = File.open(file_path, 'r')
      ticker = JSON.load(file)
      @ticker = BitFlyer::Models::Ticker.new(ticker)
      file.close
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@ticker.product_code).to eq 'BTC_JPY'
      expect(@ticker.timestamp).to eq Time.parse('2019-07-04T14:15:05.093').in_time_zone('Tokyo')
      expect(@ticker.tick_id).to eq 2948940
      expect(@ticker.best_bid).to eq 1278304
      expect(@ticker.best_ask).to eq 1279427
      expect(@ticker.best_bid_size).to eq 0.33698053
      expect(@ticker.best_ask_size).to eq 0.001
      expect(@ticker.total_bid_depth).to eq 1340.03834217
      expect(@ticker.total_ask_depth).to eq 1831.53508589
      expect(@ticker.ltp).to eq 1278304
      expect(@ticker.volume).to eq 81422.26030005
      expect(@ticker.volume_by_product).to eq 11524.89434386
    end
  end
end
