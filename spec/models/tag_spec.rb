require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
   describe 'アソシエーションのテスト' do
    context 'Trainingモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end