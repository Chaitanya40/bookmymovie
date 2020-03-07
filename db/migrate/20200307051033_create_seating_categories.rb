class CreateSeatingCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :seating_categories do |t|
      t.string :name
      t.float :price
      t.timestamps
    end
  end
end
