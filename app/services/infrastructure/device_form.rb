module Infrastructure
  class DeviceForm
    include Virtus.model
    include ActiveModel::Conversion
    include ActiveModel::Validations
    extend ActiveModel::Naming

    validates :name, :device_type, :lifecycle, presence: true

    attribute :name, String
    attribute :device_type, String
    attribute :lifecycle, String
    attribute :email_enabled, Boolean
    attribute :printer_enabled, Boolean
    attribute :profile_id, Integer

    attr_accessor :device, :persisted

    private def initialize(persisted)
      self.persisted = persisted
    end

    def self.build_new(attributes = {})
      result = new(false)
      result.attributes = attributes if attributes.present?
      result
    end

    def self.build_edit(device, attributes = {})
      result = new(true)
      result.device = device
      result.attributes = {
        name: device.name,
        device_type: device.device_type,
        lifecycle: device.lifecycle,
        email_enabled: device.email_enabled,
        printer_enabled: device.printer_enabled,
        profile_id: device.profile_id
      }
      result.attributes = attributes if attributes.present?
      result
    end

    def persisted?
      persisted
    end

    def to_param
      @device.id.to_s
    end

    def model_name
      klass = Domain::Device
      ActiveModel::Name.new(klass, klass.parent, klass.name.demodulize)
    end

    def build_device
      Domain::Device.new(
        name: name,
        device_type: device_type_value,
        lifecycle: lifecycle_value,
        email_enabled: email_enabled,
        printer_enabled: printer_enabled,
        profile_id: profile_id
      )
    end

    def update_device
      @device.name = name
      @device.device_type = device_type_value
      @device.lifecycle = lifecycle_value
      @device.email_enabled = email_enabled
      @device.printer_enabled = printer_enabled
      @device.profile_id = profile_id
    end

  private

    def device_type_value
      Domain::Device::DeviceType.find_by_key(device_type.to_sym)
    end

    def lifecycle_value
      Domain::Device::Lifecycle.find_by_key(lifecycle.to_sym)
    end
  end
end
