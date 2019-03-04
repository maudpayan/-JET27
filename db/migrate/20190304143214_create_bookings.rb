class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :price_total
      t.integer :pax_booking
      t.string :status
      t.references :user, foreign_key: true
      t.references :jet, foreign_key: true

      t.timestamps
    end
  end
end
