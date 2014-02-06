class ProductInStockToInteger < ActiveRecord::Migration
  def change
  	connection.execute(%q{
  alter table products alter column in_stock type integer using cast(in_stock as integer);
})
  end
end
