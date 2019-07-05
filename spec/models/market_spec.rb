RSpec.describe BitFlyer::Models::Market do

  describe '#initialize' do
    before do
      file_path = File.expand_path('../../tmp/market.json', __FILE__ )
      file = File.open(file_path, 'r')
      markets = JSON.load(file)
      @markets = markets.map {|market| BitFlyer::Models::Market.new(market) }
      file.close
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@markets[0].product_code).to eq 'BTC_JPY'
      expect(@markets[1].product_code).to eq 'FX_BTC_JPY'
      expect(@markets[2].product_code).to eq 'ETH_BTC'
      expect(@markets[3].product_code).to eq 'BCH_BTC'
      expect(@markets[4].product_code).to eq 'BTCJPY27SEP2019'
      expect(@markets[4].alias).to eq 'BTCJPY_MAT3M'
      expect(@markets[5].product_code).to eq 'BTCJPY05JUL2019'
      expect(@markets[5].alias).to eq 'BTCJPY_MAT1WK'
      expect(@markets[6].product_code).to eq 'BTCJPY12JUL2019'
      expect(@markets[6].alias).to eq 'BTCJPY_MAT2WK'
    end
  end
end
