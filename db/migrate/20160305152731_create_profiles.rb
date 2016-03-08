class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.integer :language_id
      t.integer :welcome_button1
      t.integer :welcome_button2
      t.integer :welcome_button3

      t.timestamps null: false
    end
  end
end
