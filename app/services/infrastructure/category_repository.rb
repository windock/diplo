module Infrastructure
  class CategoryRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

  protected

    def entity_name
      'Category'
    end

    def map_entity(entity)
      {
        name: entity.name,
        description: entity.description
      }
    end

    def map_row(row)
      Domain::Category.new(row)
    end

    def table_name
      :categories
    end
  end
end
