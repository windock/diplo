module Domain
  class ProductTranslation
    include Infrastructure::Entity

    def initialize(id: nil, product_id: nil, title: '', description: '', language: nil)
      self.id = id
      self.product_id = product_id
      self.title = title
      self.description = description
      self.language = language
    end

    attr_accessor :product_id, :title, :description, :language
  end
end
