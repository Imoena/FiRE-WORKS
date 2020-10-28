class RemoveStarFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :star, :float
  end
end
