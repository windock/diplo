module Domain
  class ProductTranslation
    def initialize(title: '', description: '', language: nil)
      self.title = title
      self.description = description
      self.language = language
    end

    attr_reader :title, :description, :language

  private

    attr_writer :title, :description, :language

  end
end
