class ProductMarket < ActiveRecord::Base
  belongs_to :product
  belongs_to :market
end
