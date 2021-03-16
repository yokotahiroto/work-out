require 'rails_helper'

RSpec.describe 'Chatモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context 'sentenceカラム' do
      it '空欄でないこと' do
        training.time = ''
        is_expected.to eq false
      end
    end
  end
    
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end