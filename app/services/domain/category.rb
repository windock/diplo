module Domain
  class Category
    include Infrastructure::Entity
    include ActiveModel::Validations

    validates :name, presence: true

    def initialize(id: nil, name: '', description: '')
      self.id = id
      self.name = name
      self.description = description
    end

    attr_accessor :name, :description

    def can_be_destroyed?
      Registry.product_repository.by_category_id(id).blank?
    end
  end
end
