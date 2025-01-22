class DropAddressTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :addresses
  end
end
