module Infrastructure
  class Form
    include Virtus.model
    include ActiveModel::Conversion
    include ActiveModel::Validations
    extend ActiveModel::Naming

    attr_accessor :persisted

    protected def initialize(persisted)
      self.persisted = persisted
      super({})
    end

    def self.build_new(attributes = {})
      result = new(false)
      result.attributes = attributes if attributes.present?
      result
    end

    def persisted?
      persisted
    end

    def to_param
      model.id.to_s
    end

    def model_name
      ActiveModel::Name.new(model_class, model_class.parent, model_class.name.demodulize)
    end
  end
end
