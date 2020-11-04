class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :content, presence: true, length: { in: 1..1000 }
  # コメントを新着順に表示
  default_scope -> { order(created_at: :desc) }

end
