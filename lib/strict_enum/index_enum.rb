module StrictEnum
  class IndexEnum < ActiveRecord::Type::Value
    def initialize(enum_type)
      @enum_type = enum_type
    end

    def type_cast_from_database(enum_value_index)
      return nil if enum_value_index.nil?
      @enum_type.find_by_ord(enum_value_index.to_i)
    end

    def type_cast_for_database(enum_value)
      return nil if enum_value.nil?
      enum_value.ord
    end

    def type_cast_from_user(value)
      if value.is_a?(@enum_type)
        value
      elsif value.is_a?(String)
        enum_value = @enum_type.find_by_key(value.to_sym)
        raise TypeError unless enum_value
        enum_value
      else
        raise TypeError
      end
    end

    #def load(enum_value_index)
    #  return nil if enum_value_index.nil?
    #  @enum_type.find_by_ord(enum_value_index)
    #end

    #def dump(enum_value)
    #  enum_value.ord
    #end
  end
end
