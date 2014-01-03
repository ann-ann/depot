class CreateProductAuthors < ActiveRecord::Migration
  def change
    create_table :product_authors do |t|
      t.belongs_to :product, index: true
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
