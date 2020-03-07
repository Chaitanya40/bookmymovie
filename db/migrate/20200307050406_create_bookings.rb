class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :customer
      t.references :screening
      t.string :booking_id
      t.timestamps
    end
  end
end
