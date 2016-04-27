module Infrastructure
  class DeviceRepository < Repository
    def sorted_by_name
      dataset.order(:name).map { |row| map_row(row) }
    end

    def for_profile_id(profile_id)
      dataset.where(profile_id: profile_id).map { |row| map_row(row) }
    end

  protected

    def entity_class
      Domain::Device
    end

    def map_entity(entity)
      {
        name: entity.name,
        device_type: entity.device_type.ord,
        lifecycle: entity.lifecycle.ord,
        email_enabled: entity.email_enabled,
        printer_enabled: entity.printer_enabled,
        profile_id: entity.profile_id
      }
    end

    def table_name
      :devices
    end

    def map_row(row)
      entity_class.new(
        id: row[:id],
        name: row[:name],
        device_type: Domain::Device::DeviceType.find_by_ord(row[:device_type]),
        lifecycle: Domain::Device::Lifecycle.find_by_ord(row[:lifecycle]),
        email_enabled: row[:email_enabled],
        printer_enabled: row[:printer_enabled],
        profile_id: row[:profile_id]
      )
    end
  end
end
