module Infrastructure
  class ProfileRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

    def persist_new(entity)
      transaction do
        super(entity)
        insert_profile_markets(entity)
      end
    end

    def persist_existing(entity)
      transaction do
        super(entity)
        replace_profile_markets(entity)
      end
    end

  protected

    def entity_class
      Domain::Profile
    end

    def map_entity(entity)
      {
        name: entity.name,
        description: entity.description,
        welcome_button1: entity.welcome_button1.ord,
        welcome_button2: entity.welcome_button2.ord,
        welcome_button3: entity.welcome_button3.ord
      }
    end

    def table_name
      :profiles
    end

    def map_row(row)
      result = entity_class.new(
        id: row[:id],
        name: row[:name],
        description: row[:description],
        welcome_button1: map_welcome_button(row[:welcome_button1]),
        welcome_button2: map_welcome_button(row[:welcome_button2]),
        welcome_button3: map_welcome_button(row[:welcome_button3])
      )
      profile_market_rows = db[:profile_markets].where(profile_id: row[:id])
      result.market_ids = profile_market_rows.map { |pm| pm[:market_id] }
      result
    end

  private

    def map_welcome_button(db_value)
      Domain::Profile::WelcomeButton.find_by_ord(db_value)
    end

    def replace_profile_markets(entity)
      db[:profile_markets].where(profile_id: entity.id).delete
      insert_profile_markets(entity)
    end

    def insert_profile_markets(entity)
      entity.market_ids.each do |profile_market_id|
        db[:profile_markets].insert(profile_id: entity.id, market_id: profile_market_id)
      end
    end
  end
end
