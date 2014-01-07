class AddCountryIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :country_id, :integer
    add_index :addresses, :country_id
  end
end
