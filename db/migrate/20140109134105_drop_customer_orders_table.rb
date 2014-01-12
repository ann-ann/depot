class DropCustomerOrdersTable < ActiveRecord::Migration
  def change
  	drop_table :customer_orders
  end
end
