class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # optional: trueでnilを許可し返信でない通常のコメントも登録できるようにしている
  belongs_to :parent,  class_name: "Comment", optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  
  validates :content, presence: true
  # validates :content, presence: true

end
