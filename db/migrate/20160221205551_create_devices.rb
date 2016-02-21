class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :username
      t.integer :device_type
      t.integer :lifecycle
      t.boolean :email_enabled
      t.boolean :printer_enabled

      t.timestamps null: false
    end
  end
end
