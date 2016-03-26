class ProductTranslation < ApplicationRecord
  belongs_to :product

  attribute :language, TypeIs::IndexEnumAttribute.new(Language), default: Language::English
end
