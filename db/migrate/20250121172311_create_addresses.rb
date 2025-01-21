class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.integer :zip_code
      t.string :street
      t.integer :number
      t.string :city
      t.string :state
      t.string :complement
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
