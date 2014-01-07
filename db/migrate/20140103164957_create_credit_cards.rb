class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.decimal :number
      t.integer :cvv
      t.integer :exp_m
      t.integer :exp_y
      t.string :fname
      t.string :lname
      t.references :customer, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
