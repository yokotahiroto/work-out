class Training < ApplicationRecord
  belongs_to :user
  belongs_to :muscle
  attachment :post_image
  
  enum meal: { 制限なし: 0, 脂質制限: 1, 糖質制限: 2, 増量: 3, チートデイ: 4 }
  enum run: { 有酸素なし: 0, 有酸素あり: 1 }
end
