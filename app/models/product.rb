class Product < ApplicationRecord
  class SkinType < TypeIs::Enum
    new :Dry, 'Dry'
    new :Normal, 'Normal'
    new :Oily, 'Oily'
    new :Combination, 'Combination'
    new :Sensitive, 'Sensitive'
  end

  class PrimaryConcern < TypeIs::Enum
    new :Unknown, 'Unknown'
    new :DailyCare, 'Daily Care'
    new :Blemish, 'Blemish'
    new :Cleanse, 'Cleanse'
    new :DailySunCare, 'Daily Sun Care'
    new :DeAging, 'De-aging'
    new :Deodorant, 'Deodorant'
    new :Dullness, 'Dullness'
    new :EyeArea, 'Eye Area'
    new :Foundation, 'Foundation'
    new :Hydration, 'Hydration'
    new :Moisturize, 'Moisturize'
    new :Pores, 'Pores'
    new :Redness, 'Redness'
    new :Shave, 'Shave'
    new :SunProtection, 'Sun Protection'
    new :Tone, 'Tone'
  end

  attribute :skin_type, TypeIs::IndexEnumAttribute.new(SkinType), default: SkinType::Normal
  attribute :primary_concern, TypeIs::IndexEnumAttribute.new(PrimaryConcern), default: PrimaryConcern::Unknown

  validates :name, :title, :primary_concern, :skin_type, :sku, presence: true

  has_many :product_markets
  has_many :markets, through: :product_markets
  has_many :translations, class_name: 'ProductTranslation'

  accepts_nested_attributes_for :translations
end
