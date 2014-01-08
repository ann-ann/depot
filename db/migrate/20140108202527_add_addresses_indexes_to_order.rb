class AddAddressesIndexesToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :shipp_address_id, :integer
   

    add_column :orders, :bill_address_id, :integer
  
  end
end
