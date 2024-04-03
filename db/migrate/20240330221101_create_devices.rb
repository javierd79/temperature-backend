class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :model
      t.string :token
      t.jsonb :variant, null: false

      t.timestamps
    end
  end
end
