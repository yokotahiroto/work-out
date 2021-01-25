class Muscle < ApplicationRecord
  has_many :training_muscles, dependent: :destroy
  has_many :training, :through => :training_muscles

  # enum part: { 腕: 0, 肩: 1, 胸: 2, 背中: 3, 上半身: 4, 下半身: 5 }
end
