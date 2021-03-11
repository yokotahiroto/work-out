# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    context 'nameカラム' do
      it '空欄でないこと' do
          user.name = ''
          is_expected.to eq false
        end

      it '20文字以下であること: 20文字は〇' do
          user.name = Faker::Lorem.characters(number: 20)
          is_expected.to eq true
        end

      it '20文字以下であること: 21文字は×' do
          user.name = Faker::Lorem.characters(number: 21)
          is_expected.to eq false
        end
    end

    context 'introductionカラム' do
      it '50文字以下であること: 50文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end

      it '50文字以下であること: 51文字は×' do
        user.introduction = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Trainingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:trainings).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Training_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end
  end
end
