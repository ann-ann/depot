class ChangePricesColumnsForOrderAndItems < ActiveRecord::Migration
  def change
  	change_column :orders, :total_price, :decimal, default: 0.0, precision: 8, scale: 2
  	change_column :order_items, :price, :decimal, default: 0.0, precision: 8, scale: 2
  end
end
