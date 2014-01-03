class ChangeOrdersPriceDefaultValue < ActiveRecord::Migration
  def change
  	change_column :orders, :total_price, :float, default: 0
  end
end
