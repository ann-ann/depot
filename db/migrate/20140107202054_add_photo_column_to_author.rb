class AddPhotoColumnToAuthor < ActiveRecord::Migration
  def change
  	add_column :authors, :photo, :string
  	add_column :authors, :biography, :text
  end
end
