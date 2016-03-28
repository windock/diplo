class Product < ApplicationRecord
  class SkinType < TypeIs::Enum
    new :Dry, 'Dry'
    new :Normal, 'Normal'
    new :Oily, 'Oily'
    new :Combination, 'Combination'
    new :Sensitive, 'Sensitive'
  end

  attribute :skin_type, TypeIs::IndexEnumAttribute.new(SkinType), default: SkinType::Normal

  validates :name, :title, :skin_type, :sku, :category, presence: true

  belongs_to :category
  belongs_to :primary_concern
  has_many :product_markets
  has_many :markets, through: :product_markets
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
end
