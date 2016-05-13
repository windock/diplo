module Infrastructure
  class ProductRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

    def by_category_id(category_id)
      dataset.where(category_id: category_id).map { |row| map_row(row) }
    end

    def persist_new(entity)
      transaction do
        super(entity)
        insert_product_markets(entity)
        insert_related_products(entity)
        insert_translations(entity)
      end
    end

    def persist_existing(entity)
      transaction do
        super(entity)
        replace_product_markets(entity)
        replace_related_products(entity)
        replace_translations(entity)
      end
    end

  protected

    def map_row(row)
      result = entity_class.new(
        id: row[:id],
        name: row[:name],
        title: row[:title],
        description: row[:description],
        primary_concern_id: row[:primary_concern_id],
        skin_type: map_skin_type(row[:skin_type]),
        sku: row[:sku],
        price: row[:price],
        category_id: row[:category_id]
      )

      product_market_rows = db[:product_markets].where(product_id: row[:id])
      result.market_ids = product_market_rows.map { |pm| pm[:market_id] }

      related_product_rows = db[:related_product_relations].where(product_id: row[:id])
      result.related_product_ids = related_product_rows.map { |rp| rp[:related_product_id] }

      translation_rows = db[:product_translations].where(product_id: row[:id])
      result.translations = translation_rows.map do |row|
        Domain::ProductTranslation.new(
          title: row[:title],
          description: row[:description],
          language: map_language(row[:language])
        )
      end

      result
    end

    def map_entity(entity)
      {
        name: entity.name,
        title: entity.title,
        description: entity.description,
        primary_concern_id: entity.primary_concern_id,
        skin_type: entity.skin_type.ord,
        sku: entity.sku,
        price: entity.price,
        category_id: entity.category_id
      }
    end

    def entity_class
      Domain::Product
    end

    def table_name
      :products
    end

  private

    def replace_translations(entity)
      db[:product_translations].where(product_id: entity.id).delete
      insert_translations(entity)
    end

    def insert_translations(entity)
      entity.translations.each do |translation|
        db[:product_translations].insert(
          product_id: entity.id,
          language: translation.language.ord,
          title: translation.title,
          description: translation.description
        )
      end
    end

    def replace_product_markets(entity)
      db[:product_markets].where(product_id: entity.id).delete
      insert_product_markets(entity)
    end

    def insert_product_markets(entity)
      entity.market_ids.each do |product_market_id|
        db[:product_markets].insert(product_id: entity.id, market_id: product_market_id)
      end
    end

    def replace_related_products(entity)
      db[:related_product_relations].where(product_id: entity.id).delete
      insert_related_products(entity)
    end

    def insert_related_products(entity)
      entity.related_product_ids.each do |related_product_id|
        db[:related_product_relations].insert(product_id: entity.id, related_product_id: related_product_id)
      end
    end

    def map_skin_type(db_value)
      Domain::Product::SkinType.find_by_ord(db_value)
    end

    def map_language(db_value)
      Domain::Language.find_by_ord(db_value)
    end
  end
end
