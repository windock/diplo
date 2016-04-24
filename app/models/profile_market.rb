class ProfileMarket < ApplicationRecord
  belongs_to :profile

  def market
    Registry.market_repository.find(market_id)
  end
end
