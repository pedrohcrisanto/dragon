class RemoveColumnsUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :jti, :string
  end
end
