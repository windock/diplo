module StrictEnum
  class IndexSerializer
    def initialize(enum_type)
      @enum_type = enum_type
    end

    def load(enum_value_index)
      return nil if enum_value_index.nil?
      @enum_type.find_by_ord(enum_value_index)
    end

    def dump(enum_value)
      enum_value.ord
    end
  end
end
