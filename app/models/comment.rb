class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # belongs_to :parent,  class_name: "Comment", optional: true　# optional: trueでnilを許可し返信でない通常のコメントも登録できるようにしている
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true

end
