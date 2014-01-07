class AddOrderIdToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :order_id, :integer
    add_index :addresses, :order_id
  end
end
