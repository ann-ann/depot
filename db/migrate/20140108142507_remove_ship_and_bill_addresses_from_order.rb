class RemoveShipAndBillAddressesFromOrder < ActiveRecord::Migration
  def change
  	remove_index(:addresses, name: :index_addresses_on_order_id)
  	remove_column(:orders, :ship_address, :string)
  	  	remove_column(:orders, :bill_address, :string)
  end
end
