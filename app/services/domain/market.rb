module Domain
  class Market
    include Infrastructure::Entity

    attr_accessor :code, :name

    def initialize(id: nil, code: '', name: '')
      self.id = id
      self.code = code
      self.name = name
    end
  end
end
