require 'rails_helper'

RSpec.describe 'Fモデルのテスト', type: :model do
   describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    
    context 'Trainingモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:training).macro).to eq :belongs_to
      end
    end
  end
end