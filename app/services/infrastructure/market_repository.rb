module Infrastructure
  class MarketRepository < Repository
  protected

    def entity_class
      Domain::Market
    end

    def map_entity(entity)
      {
        code: entity.code,
        name: entity.name
      }
    end

    def table_name
      :markets
    end
  end
end
