module Domain
  class PrimaryConcern < Infrastructure::Entity
    def initialize(id: nil, name: '', description: '')
      self.id = id
      self.name = name
      self.description = description
    end

    attr_accessor :name, :description
  end
end
