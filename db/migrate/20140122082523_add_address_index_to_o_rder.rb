class AddAddressIndexToORder < ActiveRecord::Migration
  def change
  	add_index :orders, :bill_address_id
  	add_index :orders, :shipp_address_id
  end
end
