module Infrastructure
  class ProductForm < Form
    attribute :name, String
    attribute :title, String
    attribute :description, String
    attribute :primary_concern_id, Integer
    attribute :skin_type, String
    attribute :sku, String
    attribute :price, Integer, nullify_blank: true
    attribute :category_id, Integer
    attribute :related_product_ids, Array[Integer]
    attribute :translations, Array[Integer]
    attribute :market_ids, Array[Integer]

    attr_accessor :product, :persisted

    validates :name, :title, :skin_type, :sku, :category_id, presence: true

    def self.build_edit(product, attributes = {})
      result = new(true)
      result.product = product
      result.attributes = {
        name: product.name,
        title: product.title,
        description: product.description,
        primary_concern_id: product.primary_concern_id,
        skin_type: product.skin_type.to_s,
        sku: product.sku,
        price: product.price,
        category_id: product.category_id,
        market_ids: product.market_ids,
        related_product_ids: product.related_product_ids
      }
      result.attributes = attributes if attributes.present?
      result
    end

    def build_product
      result = Domain::Product.new(
        name: name,
        title: title,
        description: description,
        primary_concern_id: primary_concern_id,
        skin_type: skin_type_value(skin_type),
        sku: sku,
        price: price,
        category_id: category_id,
        market_ids: market_ids,
        related_product_ids: related_product_ids
      )
    end

    def update_product
      @product.name = name
      @product.title = title
      @product.description = description
      @product.primary_concern_id = primary_concern_id
      @product.skin_type = skin_type_value(skin_type)
      @product.sku = sku
      @product.price = price
      @product.category_id = category_id
      @product.market_ids = market_ids
      @product.related_product_ids = related_product_ids
    end

    def translations_attributes=(attributes)
    end

    def build_new
      super
      build_translations
    end

    def market_ids=(values)
      super(values.reject(&:blank?))
    end

    def related_product_ids=(values)
      super(values.reject(&:blank?))
    end

  protected

    def model
      @product
    end

    def model_class
      Domain::Product
    end

  private

    def skin_type_value(skin_type_key)
      Domain::Product::SkinType.find_by_key(skin_type_key.to_sym)
    end
  end
end
