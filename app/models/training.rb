class Training < ApplicationRecord
  belongs_to :user
  has_many :training_muscles, dependent: :destroy
  has_many :muscles, :through => :training_muscles
  has_many :favorites, dependent: :destroy 
  has_many :favorited_users, through: :favorites, source: :user
  has_many :training_comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  attachment :post_image
  validates :time, presence: true
  validates :weight, presence: true
  
  def muscle_part
    muscles.map {|muscle| muscle.part }
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  enum meal: { 制限なし: 0, 脂質制限: 1, 糖質制限: 2, 増量: 3, チートデイ: 4 }
  enum run: { 有酸素なし: 0, 有酸素あり: 1 }
end
