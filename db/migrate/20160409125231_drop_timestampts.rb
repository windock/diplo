class DropTimestampts < ActiveRecord::Migration[5.0]
  def up
    remove_timestamps :categories
    remove_timestamps :devices
    remove_timestamps :product_markets
    remove_timestamps :product_translations
    remove_timestamps :products
    remove_timestamps :profiles
  end
end
