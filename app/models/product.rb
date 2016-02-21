class Product < ActiveRecord::Base
  validates :name, :title, :concern_id, :skin_type, :sku, presence: true
end
