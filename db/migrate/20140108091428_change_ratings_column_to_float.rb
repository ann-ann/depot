class ChangeRatingsColumnToFloat < ActiveRecord::Migration
  def change
    change_column :ratings, :rating, :float, scale: 1
  end
end
