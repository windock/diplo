class Device < ApplicationRecord
  class DeviceType < TypeIs::Enum
    new :Kiosk, 'Kiosk'
    new :Consultant, 'Consultant'
  end

  class Lifecycle < TypeIs::Enum
    new :Inventory, 'Inventory'
    new :InService, 'In service'
    new :Decomissioned, 'Decomissioned'
  end

  attribute :device_type, TypeIs::IndexEnumAttribute.new(DeviceType), default: DeviceType::Consultant
  attribute :lifecycle,   TypeIs::IndexEnumAttribute.new(Lifecycle),  default: Lifecycle::Inventory

  validates :username, :device_type, :lifecycle, presence: true

  belongs_to :profile
end
