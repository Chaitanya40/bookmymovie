class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.references :screening
      t.references :seating_category
      t.string :seat_number
      t.integer :status
      t.timestamps
    end
  end
end
