class CreateBookingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_items do |t|
      t.references :booking
      t.string :seat_number
      t.timestamps
    end
  end
end
