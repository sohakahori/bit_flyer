RSpec.describe BitFlyer::Models::Health do

  describe '#initialize' do
    let(:health) { {'status' => 'NORMAL'} }
    before do
      @health = BitFlyer::Models::Health.new(health)
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@health.status).to eq 'NORMAL'
    end
  end
end
