module HasMarkets
  def markets
    market_association.map(&:market)
  end

  def markets=(markets)
    self.market_ids = markets.map(&:id)
  end

  def market_ids
    market_association.map(&:market_id)
  end

  def market_ids=(market_ids)
    market_association.clear
    market_ids.reject(&:blank?).each do |market_id|
      market_association.build(market_id: market_id)
    end
  end
end
