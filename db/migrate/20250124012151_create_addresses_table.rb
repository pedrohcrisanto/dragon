class CreateAddressesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.integer :zip_code, null: false
      t.string :street, null: false
      t.integer :number, null: false
      t.string :complement
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
