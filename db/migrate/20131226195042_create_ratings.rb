class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :product, index: true
      t.belongs_to :customer, index: true
      t.integer :rating
      t.text :text

      t.timestamps
    end
  end
end
