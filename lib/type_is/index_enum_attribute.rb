module TypeIs
  class IndexEnumAttribute < ActiveRecord::Type::Value
    def initialize(enum_type)
      @enum_type = enum_type
    end

    #attribute :welcome_button1, TypeIs::IndexEnum.new(WelcomeButton), default: 1
    #attribute :welcome_button2, TypeIs::IndexEnum.new(WelcomeButton), default: Profile::WelcomeButton::MEN_CATALOGUE
    #attribute :welcome_button3, TypeIs::IndexEnum.new(WelcomeButton), default: '3'
    def type_cast_from_database(enum_value)
      case enum_value
      when String
        @enum_type.find_by_ord(enum_value.to_i)
      when Fixnum
        @enum_type.find_by_ord(enum_value)
      when @enum_type
        enum_value
      when NilClass
        nil
      else
        raise TypeError
      end
    end
    alias :deserialize :type_cast_from_database

    def type_cast_for_database(enum_value)
      return nil if enum_value.nil?
      enum_value.ord
    end
    alias :serialize :type_cast_for_database

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
    alias :cast :type_cast_from_user
  end
end
