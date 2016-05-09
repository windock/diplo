module Domain
  class Device
    include Infrastructure::Entity

    class DeviceType < TypeIs::Enum
      new :Kiosk, 'Kiosk'
      new :Consultant, 'Consultant'
    end

    class Lifecycle < TypeIs::Enum
      new :Inventory, 'Inventory'
      new :InService, 'In service'
      new :Decommissioned, 'Decommissioned'
    end

    def initialize(name:, profile_id:, id: nil, device_type: DeviceType::Consultant,
                   lifecycle: Lifecycle::Inventory, email_enabled: false, printer_enabled: false)
      self.id = id
      self.name = name
      self.device_type = device_type
      self.lifecycle = lifecycle
      self.email_enabled = email_enabled
      self.printer_enabled = printer_enabled
      self.profile_id = profile_id
    end

    attr_accessor :name, :device_type, :lifecycle, :email_enabled, :printer_enabled, :profile_id

    def profile
      Registry.profile_repository.find(profile_id)
    end

    def name=(name)
      raise ArgumentError if name.nil? || name == ''
      @name = name
    end

    def device_type=(device_type)
      raise ArgumentError if device_type.nil?
      @device_type = device_type
    end

    def lifecycle=(lifecycle)
      raise ArgumentError if lifecycle.nil?
      @lifecycle = lifecycle
    end

    def profile_id=(profile_id)
      raise ArgumentError if profile_id.nil?
      @profile_id = profile_id
    end
  end
end
