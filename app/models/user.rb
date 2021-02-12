class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  attachment :image
  attachment :post_image
  
  has_many :trainings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :training
  has_many :favorite_trainings, through: :favorites, source: :training
  has_many :training_comments, dependent: :destroy
  has_many :chats,dependent: :destroy
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  
  validates :name, presence: true
  
  def follow(user_id)
  follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
  following_user.include?(user)
  end
  
  def muscle_part
    muscles.map {|muscle| muscle.part }
  end
  
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
end