class DropContactTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :contacts
  end
end
