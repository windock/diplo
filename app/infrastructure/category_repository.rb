module Infrastructure
  class CategoryRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

    def find_by_name(name)
      map_row(dataset[name: name])
    end

  protected

    def entity_class
      Domain::Category
    end

    def map_entity(entity)
      {
        name: entity.name,
        description: entity.description
      }
    end

    def table_name
      :categories
    end
  end
end
