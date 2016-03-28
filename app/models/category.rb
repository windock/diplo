class Category < ApplicationRecord
  def can_be_destroyed?
    Product.where(category: self).blank?
  end
end
