class ProductMarket < ApplicationRecord
  belongs_to :product

  def market
    Registry.market_repository.find(market_id)
  end
end
