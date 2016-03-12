module TypeIs
  class Enum < TypesafeEnum::Base
    def to_s
      key
    end
  end
end
