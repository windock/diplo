module Infrastructure
  module PresentsEntity
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    def persisted?
      id.present?
    end

    def to_param
      id.to_s
    end

    def model_name
      klass = __getobj__.class
      ActiveModel::Name.new(klass, klass.parent, klass.name.demodulize)
    end
  end
end
