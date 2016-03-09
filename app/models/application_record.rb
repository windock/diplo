class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.has_enum(attribute, type)
    puts "I AM NOT WHAT ======="
    serialize attribute, StrictEnum::IndexSerializer.new(type)

    define_method("#{attribute}=") do |value|
      value = type.find_by_key(value.to_sym) if value.is_a?(String)
      super(value)
    end
  end
end
