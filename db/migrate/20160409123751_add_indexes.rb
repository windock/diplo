class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :product_markets, :products
    add_foreign_key :product_markets, :markets
    add_foreign_key :products, :categories
    add_foreign_key :products, :primary_concerns
    add_foreign_key :related_product_relations, :products
    add_foreign_key :related_product_relations, :products, column: :related_product_id
  end
end
