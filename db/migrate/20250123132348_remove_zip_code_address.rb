class RemoveZipCodeAddress < ActiveRecord::Migration[8.0]
  def change
    remove_column :addresses, :zip_code, :integer
  end
end
