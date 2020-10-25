class RemovePrefectureFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :prefecture, :integer
  end
end
