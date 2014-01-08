class DropCustomerOrders < ActiveRecord::Migration
  def change
  	remove_index(:customer_orders, name: :index_customer_orders_on_customer_id)
  	remove_index(:customer_orders, name: :index_customer_orders_on_order_id)
  end
end
