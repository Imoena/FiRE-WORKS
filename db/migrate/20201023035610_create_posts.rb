class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :festival
      t.integer :prefecture, null: false, default: 0
      t.string :city
      t.string :transportation
      t.integer :status, default: 0, null:false
      t.text :impressions
      t.string :image_id
      t.date :date
      t.float :rate
      t.integer :user_id
      t.string :belongings
      t.timestamps
    end
  end
end
