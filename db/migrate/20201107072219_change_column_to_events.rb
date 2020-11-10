class ChangeColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  change_column_null :events, :address, null: false
  change_column_null :events, :latitude, null: false
  change_column_null :events, :longitude, null: false
  end
end
