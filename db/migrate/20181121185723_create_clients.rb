class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.integer :cpf
      t.date :birthday
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
