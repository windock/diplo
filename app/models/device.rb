class Device < ApplicationRecord
  class DeviceType < TypeIs::Enum
    new :Kiosk, 'Kiosk'
    new :Consultant, 'Consultant'

    def to_s
      key
    end
  end

  class Lifecycle < TypeIs::Enum
    new :Inventory, 'Inventory'
    new :InService, 'In service'
    new :Decomissioned, 'Decomissioned'

    def to_s
      key
    end
  end

  attribute :device_type, TypeIs::IndexEnumAttribute.new(DeviceType)
  attribute :lifecycle, TypeIs::IndexEnumAttribute.new(Lifecycle)

  validates :username, :device_type, :lifecycle, presence: true

end
