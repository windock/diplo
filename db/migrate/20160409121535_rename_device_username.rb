class RenameDeviceUsername < ActiveRecord::Migration[5.0]
  def change
    rename_column :devices, :username, :name
  end
end
