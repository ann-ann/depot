class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.belongs_to :product, index: true
      t.belongs_to :type, index: true

      t.timestamps
    end
  end
end
