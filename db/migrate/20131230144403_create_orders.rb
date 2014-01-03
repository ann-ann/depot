class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price
      t.string :state
      t.string :completed_at
      t.string :bill_address
      t.string :ship_address

      t.timestamps
    end
  end
end
