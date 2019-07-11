RSpec.describe BitFlyer::Models::Chat do

  describe '#initialize' do
    before do
      file_path = File.expand_path('../../tmp/chat.json', __FILE__ )
      file = File.open(file_path, 'r')
      chats = JSON.load(file)
      @chats = chats.map {|chat| BitFlyer::Models::Chat.new(chat) }
      file.close
    end

    it 'インスタンス変数が正しくセットされていること' do
      expect(@chats[0].nickname).to eq 'テスト'
      expect(@chats[0].message).to eq '暴落ショック'
      expect(@chats[0].date).to eq '2019-06-24T08:39:45.633'
    end
  end
end
