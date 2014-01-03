class ChangePriceToFloatOrderItem < ActiveRecord::Migration
  def change
  	change_column :order_items, :price, :float
  end
end
