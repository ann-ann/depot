class DropCategorizationsTable < ActiveRecord::Migration
  def change
  	drop_table :categorizations
  end
end
