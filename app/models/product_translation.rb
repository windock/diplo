class ProductTranslation < ApplicationRecord
  belongs_to :product

  attribute :language, TypeIs::IndexEnumAttribute.new(Domain::Language), default: Domain::Language::English
end
