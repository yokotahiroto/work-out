require 'rails_helper'

RSpec.describe 'Muscleモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'TrainingMuscleモデルとの関係' do
        it '1:Nとなっている' do
          expect(Training.reflect_on_association(:training_muscles).macro).to eq :has_many
        end
      end
      
      context 'Trainingモデルとの関係' do
        it '1:Nとなっている' do
          expect(Training.reflect_on_association(:training).macro).to eq :has_many
        end
      end
  end
end