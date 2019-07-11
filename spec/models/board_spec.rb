RSpec.describe BitFlyer::Models::Board do
  describe '#initialize' do
    before do
      file_path = File.expand_path('../../tmp/board.json', __FILE__ )
      file = File.open(file_path, 'r')
      board = JSON.load(file)
      @board = BitFlyer::Models::Board.new(board)
      file.close
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@board.mid_price).to eq 1273730
    end
  end

  describe '#bids' do
    before do
      file_path = File.expand_path('../../tmp/board.json', __FILE__ )
      file = File.open(file_path, 'r')
      board = JSON.load(file)
      @board = BitFlyer::Models::Board.new(board)
      file.close
    end

    it 'arrayをレスポンスすること' do
      expect(@board.bids.class).to eq Array
    end
  end
end
