class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :festival
      t.integer :prefecture, default: 0, null: false
      t.string :city
      t.string :transportation
      t.text :content
      t.string :event_image_id
      t.datetime :start_time
      t.string :addres
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
