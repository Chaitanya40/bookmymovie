class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :language
      t.text :info
      t.integer :run_time_in_minutes
      t.timestamps
    end
  end
end
