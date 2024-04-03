class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.float :temperature
      t.float :humidity
      t.float :thermal_sensation
      t.string :degree
      t.references :archive, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
