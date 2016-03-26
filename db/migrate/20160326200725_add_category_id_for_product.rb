class AddCategoryIdForProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :category
  end
end
