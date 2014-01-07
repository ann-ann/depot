class ProductInStockToInteger < ActiveRecord::Migration
  def change
  	change_column :products, :in_stock, :integer
  end
end
