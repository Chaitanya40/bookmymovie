class CreateScreenings < ActiveRecord::Migration[5.2]
  def change
    create_table :screenings do |t|
      t.references :movie
      t.references :auditorium
      t.datetime :start_time
      t.timestamps
    end
  end
end
