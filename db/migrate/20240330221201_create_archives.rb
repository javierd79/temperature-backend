class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives do |t|
      t.date :current
      t.string :device_token

      t.timestamps
    end
  end
end
