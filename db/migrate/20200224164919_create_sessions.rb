class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :movie, null: false
      t.string :description
      t.text :neighborhood, null: false
      t.string :address
      t.datetime :date, null: false
      t.integer :capacity, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
