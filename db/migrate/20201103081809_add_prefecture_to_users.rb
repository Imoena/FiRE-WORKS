class AddPrefectureToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :prefecture, :integer, default: 0, null: false
  end
end
