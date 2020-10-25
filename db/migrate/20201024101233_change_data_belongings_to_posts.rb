class ChangeDataBelongingsToPosts < ActiveRecord::Migration[5.2]
  def change
  	 change_column :posts, :belongings, :string
  end
end
