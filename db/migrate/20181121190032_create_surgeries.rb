class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.datetime :date_hours
      t.text :feedback
      t.references :doctors, foreign_key: true
      t.references :rooms, foreign_key: true
      t.references :clients, foreign_key: true

      t.timestamps
    end
  end
end
