class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.datetime :date_hours
      t.text :feedback
      t.references :doctor, foreign_key: true
      t.references :room, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
