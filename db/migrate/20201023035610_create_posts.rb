class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :festival
      t.string :prefecture
      t.string :city
      t.string :transportation
      t.string :status, default: 0, null:false
      t.text :impressions
      t.string :image_id
      t.integer :date
      t.integer :belongings
      t.timestamps
    end
  end
end
