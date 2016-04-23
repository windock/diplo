module Infrastructure
  class PrimaryConcernRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

    def remove(entity)
      db.transaction do
        db[:products].where(primary_concern_id: entity.id).update(primary_concern_id: nil)
        super(entity)
      end
    end

    protected

    def entity_name
      'PrimaryConcern'
    end


    def map_entity(entity)
      {
        name: entity.name,
        description: entity.description
      }
    end

    def map_row(row)
      Domain::PrimaryConcern.new(row)
    end

    def table_name
      :primary_concerns
    end
  end
end
