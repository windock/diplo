module Infrastructure
  class Repository

    def persist(entity)
      if entity.id
        persist_existing(entity)
      else
        persist_new(entity)
      end
    end

    def persist_new(entity)
      id = dataset.insert(map_entity(entity))
      entity.id = id
      entity
    end

    def persist_existing(entity)
      row = dataset.where(id: entity.id)
      row.update(map_entity(entity))
      entity
    end

    def find(id)
      row = dataset[id: id]
      raise Domain::EntityNotFound.new("Could not find #{entity_class.name} with 'id'=#{id}") if row.nil?
      map_row(row)
    end

    def all
      dataset.map { |row| map_row(row) }
    end

    def remove(entity)
      dataset[id: entity.id].delete
    end

    def remove_all
      dataset.delete
    end

  protected

    def map_row(row)
      entity_class.new(row)
    end

    def dataset
      Registry.db[table_name]
    end

    def db
      Registry.db
    end
  end
end
