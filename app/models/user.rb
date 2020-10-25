class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得できる
  has_many :liked_posts, through: :likes, source: :post
  attachment :profile_image

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
