class AddProfileToDevice < ActiveRecord::Migration[5.0]
  def change
    add_reference :devices, :profile, foreign_key: true
  end
end
