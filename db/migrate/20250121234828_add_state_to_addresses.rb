class AddStateToAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :addresses, :state, :string
  end
end
