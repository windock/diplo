class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :concern_id
      t.integer :skin_type
      t.string :sku
      t.decimal :price

      t.timestamps null: false
    end
  end
end
