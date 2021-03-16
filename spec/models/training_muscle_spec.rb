require 'rails_helper'

RSpec.describe 'TrainingMuscleモデルのテスト', type: :model do
   describe 'アソシエーションのテスト' do
    context 'Muscleモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:muscle).macro).to eq :belongs_to
      end
    end
    
    context 'Trainingモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:training).macro).to eq :belongs_to
      end
    end
  end
end