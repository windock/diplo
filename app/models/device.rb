class Device < ActiveRecord::Base
  enum device_type: [ :kiosk, :consultant ]
  enum lifecycle: [ :inventory, :in_service, :decomissioned ]

  validates :username, :device_type, :lifecycle, presence: true
end
