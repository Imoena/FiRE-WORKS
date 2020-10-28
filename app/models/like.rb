class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # post_idとuser_idの組が1組しか存在しないようにする
  validates_uniqueness_of :post_id, scope: :user_id
end
