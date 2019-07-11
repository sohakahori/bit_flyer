RSpec.describe BitFlyer::Models::Execution do

  before do
    file_path = File.expand_path('../../tmp/execution.json', __FILE__ )
    file = File.open(file_path, 'r')
    executions = JSON.load(file)
    @executions = executions.map {|execution| BitFlyer::Models::Execution.new(execution) }
    file.close
  end

  describe '#initialize' do
    it 'インスタンス変数が正しくセットされていること' do
      expect(@executions.count).to eq 1
      expect(@executions.first.id).to eq 1144436082
      expect(@executions.first.side).to eq 'SELL'
      expect(@executions.first.price).to eq 1277102
      expect(@executions.first.size).to eq 0.009
      expect(@executions.first.exec_date).to eq Time.parse('2019-07-04T14:29:29.527').in_time_zone('Tokyo')
      expect(@executions.first.buy_child_order_acceptance_id).to eq 'JRF20190704-142923-142748'
      expect(@executions.first.sell_child_order_acceptance_id).to eq 'JRF20190704-142929-774899'
    end
  end
end
