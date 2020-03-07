class CreateAuditoria < ActiveRecord::Migration[5.2]
  def change
    create_table :auditoria do |t|
      t.string :name
      t.references :cinema
      t.boolean :active
      t.timestamps
    end
  end
end
