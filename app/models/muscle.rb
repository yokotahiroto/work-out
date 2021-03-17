class Muscle < ApplicationRecord
  has_many :training_muscles, dependent: :destroy
  has_many :training, :through => :training_muscles
end
