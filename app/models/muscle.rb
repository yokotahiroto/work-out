class Muscle < ApplicationRecord
  has_many :trainings, dependent: :destroy
  
  enum part: { 腕: 0, 肩: 1, 胸: 2, 背中: 3, 上半身: 4, 下半身: 5 }
end
