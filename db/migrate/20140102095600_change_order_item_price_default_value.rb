class ChangeOrderItemPriceDefaultValue < ActiveRecord::Migration
  def change
    change_column :order_items, :quantity, :float, default: 0
  end
end
