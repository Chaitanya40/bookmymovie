class CreateCinemas < ActiveRecord::Migration[5.2]
  def change
    create_table :cinemas do |t|
      t.string :name
      t.string :city
      t.string :locality
      t.timestamps
    end
  end
end
