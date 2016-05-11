module Infrastructure
  class ProductForm < Form
    class TranslationForm < Form
      attribute :title, String
      attribute :description, String
      attribute :language, String

      def self.build_edit(translation)
        result = new
        result.persisted = false
        result.attributes = {
          title: translation.title,
          description: translation.description,
          language: translation.language.to_s
        }
        result
      end

      def self.build_new(language)
        result = new
        result.persisted = false
        result.language = language.to_s
        result
      end

      def model_class
        Domain::ProductTranslation
      end
    end

    attribute :name, String
    attribute :title, String
    attribute :description, String
    attribute :primary_concern_id, Integer
    attribute :skin_type, String
    attribute :sku, String
    attribute :price, Integer, nullify_blank: true
    attribute :category_id, Integer
    attribute :related_product_ids, Array[Integer]
    attribute :translations, Array[TranslationForm]
    attribute :market_ids, Array[Integer]

    attr_accessor :product, :persisted

    validates :name, :title, :skin_type, :sku, :category_id, presence: true

    def self.build_new(attributes = {})
      result = super
      if attributes.blank?
        result.translations = Domain::Language.map do |language|
          TranslationForm.build_new(language)
        end
      end
      result
    end

    def self.build_edit(product, attributes = {})
      result = new
      result.persisted = true
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
        related_product_ids: product.related_product_ids,
      }
      result.build_translation_forms
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
      result.translations = build_translation_values
      result
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
      @product.translations = build_translation_values
    end

    def translations_attributes=(attributes)
      self.translations = attributes.map { |_, v| v }
    end

    def market_ids=(values)
      super(values.reject(&:blank?))
    end

    def related_product_ids=(values)
      super(values.reject(&:blank?))
    end

    def build_translation_values
      translations.map do |translation|
        Domain::ProductTranslation.new(
          title: translation.title,
          description: translation.description,
          language: Domain::Language.find_by_key(translation.language.to_sym)
        )
      end
    end

    def build_translation_forms
      Domain::Language.to_a.each do |language|
        product_translation = product.translations.detect { |t| t.language == language }
        if product_translation
          self.translations << TranslationForm.build_edit(product_translation)
        else
          self.translations << TranslationForm.build_new(language)
        end
      end
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
