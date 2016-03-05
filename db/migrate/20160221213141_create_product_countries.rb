class CreateProductCountries < ActiveRecord::Migration
  def change
    create_table :product_markets do |t|
      t.integer :market_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
