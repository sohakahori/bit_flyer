RSpec.describe BitFlyer::Models::BoardState do
  describe '#initialize' do
    let(:board_state) do
      {
        'health' => 'NORMAL',
        'state' => 'RUNNING'
      }
    end
    before do
      @board_state = BitFlyer::Models::BoardState.new(board_state)
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@board_state.health).to eq 'NORMAL'
      expect(@board_state.state).to eq 'RUNNING'
    end
  end

  describe '#data', forcus: true do
    let(:board_state) do
      {
        'health' => 'NORMAL',
        'state' => 'RUNNING',
        'data' => {
          'special_quotation': 410897
        }
      }
    end

    before do
      @board_state = BitFlyer::Models::BoardState.new(board_state)
    end

    it 'BitFlyer::Models::BoardStates::Dataのインスタンスを返す' do
      expect(@board_state.data.class).to eq BitFlyer::Models::BoardStates::Data
    end
  end
end
