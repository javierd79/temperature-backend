class AddIsActiveToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :is_active, :boolean, default: true
  end
end
