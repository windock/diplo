class Product < ApplicationRecord
  class SkinType < TypeIs::Enum
    new :Dry, 'Dry'
    new :Normal, 'Normal'
    new :Oily, 'Oily'
    new :Combination, 'Combination'
    new :Sensitive, 'Sensitive'

    def to_s
      key
    end
  end

  class PrimaryConcern < TypeIs::Enum
    new :Unknown, 'Unknown'
    new :Daily_care, 'Daily Care'
    new :Blemish, 'Blemish'
    new :Cleanse, 'Cleanse'
    new :Daily_sun_care, 'Daily Sun Care'
    new :De_aging, 'De-aging'
    new :Deodorant, 'Deodorant'
    new :Dullness, 'Dullness'
    new :Eye_area, 'Eye Area'
    new :Foundation, 'Foundation'
    new :Hydration, 'Hydration'
    new :Moisturize, 'Moisturize'
    new :Pores, 'Pores'
    new :Redness, 'Redness'
    new :Shave, 'Shave'
    new :Sun_protection, 'Sun Protection'
    new :Tone, 'Tone'

    def to_s
      key
    end
  end

  attribute :skin_type, TypeIs::IndexEnumAttribute.new(SkinType)
  attribute :primary_concern, TypeIs::IndexEnumAttribute.new(PrimaryConcern)

  validates :name, :title, :primary_concern, :skin_type, :sku, presence: true

  has_many :product_markets
  has_many :markets, through: :product_markets
end
