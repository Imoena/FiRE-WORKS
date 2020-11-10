class ChangeColumnAddresToAdress < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :addres, :address
  end
end
