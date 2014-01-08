class ChangeOrderCompletedAtToDate < ActiveRecord::Migration
  def change
  	change_column :orders, :completed_at, :datetime
  end
end
