class AddAttrsToAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :addresses, :country, :string, null: false
    add_column :addresses, :state, :string, null: false
    add_column :addresses, :city, :string, null: false
  end
end
