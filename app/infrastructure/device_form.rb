module Infrastructure
  class DeviceForm < Form
    validates :name, :device_type, :lifecycle, presence: true

    attribute :name, String
    attribute :device_type, String
    attribute :lifecycle, String
    attribute :email_enabled, Boolean
    attribute :printer_enabled, Boolean
    attribute :profile_id, Integer

    attr_accessor :device, :persisted

    def self.build_edit(device, attributes = {})
      result = new
      result.persisted = true
      result.device = device
      result.attributes = {
        name: device.name,
        device_type: device.device_type.to_s,
        lifecycle: device.lifecycle.to_s,
        email_enabled: device.email_enabled,
        printer_enabled: device.printer_enabled,
        profile_id: device.profile_id
      }
      result.attributes = attributes if attributes.present?
      result
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

  protected

    def model
      @device
    end

    def model_class
      Domain::Device
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
