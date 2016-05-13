module Infrastructure
  module Entity
    attr_accessor :id

    def ==(o)
      self.class == o.class &&
        self.id == o.id
    end
  end
end
