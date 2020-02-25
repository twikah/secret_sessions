class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :session, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :total, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
