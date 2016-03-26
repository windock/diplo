class CreateProductTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :product_translations do |t|
      t.references :product, foreign_key: true
      t.string :title
      t.text :description
      t.integer :language

      t.timestamps
    end
  end
end
