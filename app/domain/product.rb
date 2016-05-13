module Domain
  class Product
    include Infrastructure::Entity

    class SkinType < TypeIs::Enum
      new :Dry, 'Dry'
      new :Normal, 'Normal'
      new :Oily, 'Oily'
      new :Combination, 'Combination'
      new :Sensitive, 'Sensitive'
    end

    def initialize(id: nil, name: '', title: '', description: '',
                   primary_concern_id: nil, skin_type: nil, sku: '', price: 0,
                   category_id: nil, market_ids: [], related_product_ids: [],
                   translations: [])
      self.id = id
      self.name = name
      self.title = title
      self.description = description
      self.primary_concern_id = primary_concern_id
      self.skin_type = skin_type
      self.sku = sku
      self.price = price
      self.category_id = category_id
      self.market_ids = market_ids
      self.related_product_ids = related_product_ids
      self.translations = []
    end

    attr_accessor :name, :title, :description, :primary_concern_id,
      :skin_type, :sku, :price, :category_id, :related_product_ids, :market_ids,
      :related_product_ids, :translations

    def category
      Registry.category_repository.find(category_id) if category_id
    end

    def category=(category)
      self.category_id = category.id
    end

    def primary_concern
      Registry.primary_concern_repository.find(primary_concern_id) if primary_concern_id
    end

    def primary_concern=(primary_concern)
      self.primary_concern_id = primary_concern.id
    end

    def related_product_ids=(ids)
      @related_product_ids = ids.uniq
    end

    def related_products_uniqueness
      if related_product_ids.uniq != related_product_ids
        errors.add(:related_products, 'should be unique')
      end
    end
  end
end
