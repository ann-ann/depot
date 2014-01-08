class AddDefaultValueToOrderItemPrice < ActiveRecord::Migration
  def change
  	change_column :order_items, :price, :integer, default: 0
  end
end
