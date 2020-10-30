class ChangeDataStatusPosts < ActiveRecord::Migration[5.2]
  def change
  	  change_column :posts, :status, :integer
  end
end
