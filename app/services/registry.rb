class Registry
  def self.db
    Sequel::Model.db
  end

  def self.category_repository
    Infrastructure::CategoryRepository.new
  end

  def self.primary_concern_repository
    Infrastructure::PrimaryConcernRepository.new
  end

  def self.market_repository
    Infrastructure::MarketRepository.new
  end
end

R = Registry
