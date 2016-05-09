class Product < ApplicationRecord
  include HasMarkets

  attribute :skin_type, TypeIs::IndexEnumAttribute.new(Domain::Product::SkinType), default: Domain::Product::SkinType::Normal

  validates :name, :title, :skin_type, :sku, :category_id, presence: true

  has_many :product_markets
  has_many :translations, class_name: 'ProductTranslation'
  has_many :related_product_relations
  has_many :related_products, through: :related_product_relations

  validate :related_products_uniqueness

  accepts_nested_attributes_for :translations

  def related_products_uniqueness
    if related_product_ids.uniq != related_product_ids
      errors.add(:related_products, "should be unique")
    end
  end

  def related_product_ids=(ids)
    super(ids.uniq)
  end

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

protected

  def market_association
    product_markets
  end
end
