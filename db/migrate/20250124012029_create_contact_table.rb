class CreateContactTable < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.string :cellphone, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
