module Infrastructure
  class Repository
    def persist_new(entity)
      id = dataset.insert(map_entity(entity))
      category.id = id
      category
    end

    def persist_existing(entity)
      row = dataset.where(id: entity.id)
      row.update(map_entity(entity))
      entity
    end

    def find(id)
      row = dataset.where(id: id).first
      raise Domain::EntityNotFound.new("Could not find #{entity_name} with 'id'=#{id}") if row.nil?
      map_row(row)
    end

    def all
      dataset.map { |row| map_row(row) }
    end

    def remove(entity)
      dataset.where(id: entity.id).delete
    end

  protected

    def dataset
      Registry.db[table_name]
    end

    def db
      Registry.db
    end
  end
end
