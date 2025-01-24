class AddZipCodeToAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :addresses, :zip_code, :string
  end
end
