class DropTables < ActiveRecord::Migration
  def change
    drop_table :boards
    drop_table :lists
    drop_table :cards
    drop_table :card_members
  end
end
