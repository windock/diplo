class AddUniqueIndexForRelatedProducts < ActiveRecord::Migration[5.0]
  def change
    add_index(:related_product_relations, [:product_id, :related_product_id], unique: true, name: 'product_uniqueness')
  end
end
