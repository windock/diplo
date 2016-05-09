class Registry
  def self.db
    Sequel::Model.db
  end

  def self.category_repository
    Infrastructure::CategoryRepository.new(db)
  end

  def self.primary_concern_repository
    Infrastructure::PrimaryConcernRepository.new(db)
  end

  def self.market_repository
    Infrastructure::MarketRepository.new(db)
  end

  def self.device_repository
    Infrastructure::DeviceRepository.new(db)
  end

  def self.profile_repository
    Infrastructure::ProfileRepository.new(db)
  end

  def self.product_repository
    Infrastructure::ProductRepository.new(db)
  end
end
