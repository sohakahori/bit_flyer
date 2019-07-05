RSpec.describe BitFlyer::Models::BalanceHistory do

  describe '#initialize' do
    before do
      file_path = File.expand_path('../../tmp/balance_history.json', __FILE__ )
      file = File.open(file_path, 'r')
      balance_histories = JSON.load(file)
      @balance_histories = balance_histories.map {|balance_history| BitFlyer::Models::BalanceHistory.new(balance_history) }
      file.close
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@balance_histories[0].id).to eq 1
      expect(@balance_histories[0].trade_date).to eq '2019-06-12T23:43:05.723'
      expect(@balance_histories[0].currency_code).to eq 'JPY'
      expect(@balance_histories[0].trade_type).to eq 'BUY'
      expect(@balance_histories[0].price).to eq 1000
      expect(@balance_histories[0].amount).to eq -1
      expect(@balance_histories[0].quantity).to eq 0.001
      expect(@balance_histories[0].commission).to eq 0
      expect(@balance_histories[0].balance).to eq 17145
      expect(@balance_histories[0].order_id).to eq 'IDT20190612-5254252-462454'
    end
  end
end
