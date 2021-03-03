require 'rails_helper'

RSpec.describe 'Bookモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context 'timeカラム' do
      it '空欄でないこと' do
        training.time = ''
        is_expected.to eq false
      end
    end
    
    context 'weightカラム' do
      it '空欄でないこと' do
        training.weight = ''
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
    
    context 'TrainingMuscleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:training_muscles).macro).to eq :has_many
      end
    end
    
    context 'Muscleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:muscles).macro).to eq :has_many
      end
    end
    
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    
    context 'TrainingCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:training_comments).macro).to eq :has_many
      end
    end
    
    context 'TrainingMuscleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:training_muscles).macro).to eq :has_many
      end
    end
    
    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end
end