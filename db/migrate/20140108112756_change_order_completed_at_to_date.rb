class ChangeOrderCompletedAtToDate < ActiveRecord::Migration
  def change
   	connection.execute(%q{
  alter table orders alter column completed_at type timestamp using cast(completed_at as timestamp);
})
  end
end

