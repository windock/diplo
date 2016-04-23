module Domain
  class Category < Infrastructure::Entity
    def initialize(id: nil, name: '', description: '')
      self.id = id
      self.name = name
      self.description = description
    end

    attr_accessor :name, :description

    def can_be_destroyed?
      Product.where(category: self).blank?
    end
  end
end
