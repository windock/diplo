class ReplaceForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "devices", "profiles"
    remove_foreign_key "product_markets", "markets"
    remove_foreign_key "product_markets", "products"
    remove_foreign_key "product_translations", "products"
    remove_foreign_key "products", "categories"
    remove_foreign_key "products", "primary_concerns"
    remove_foreign_key "profile_markets", "markets"
    remove_foreign_key "profile_markets", "profiles"
    remove_foreign_key "related_product_relations", "products"
    remove_foreign_key "related_product_relations", column: "related_product_id"

    add_foreign_key "devices", "profiles", on_delete: :restrict
    add_foreign_key "product_markets", "markets", on_delete: :cascade
    add_foreign_key "product_markets", "products", on_delete: :cascade
    add_foreign_key "product_translations", "products", on_delete: :cascade
    add_foreign_key "products", "categories", on_delete: :restrict
    add_foreign_key "products", "primary_concerns", on_delete: :nullify
    add_foreign_key "profile_markets", "markets", on_delete: :cascade
    add_foreign_key "profile_markets", "profiles", on_delete: :cascade
    add_foreign_key "related_product_relations", "products", on_delete: :cascade
    add_foreign_key "related_product_relations", "products", column: "related_product_id", on_delete: :cascade
  end
end
