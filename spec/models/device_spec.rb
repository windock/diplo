describe Device do
  describe 'serializes to database' do
    specify 'with default values' do
      device = Device.new(username: '1')
      device.save
      device.reload

      expect(device).to have_attributes(
        username: '1',
        device_type: Device::DeviceType::Consultant,
        lifecycle: Device::Lifecycle::Inventory
      )
    end

    it 'with provided values' do
      device = Device.new(username: '1', device_type: Device::DeviceType::Kiosk, lifecycle: Device::Lifecycle::InService)
      device.save
      device.reload

      expect(device).to have_attributes(
        device_type: Device::DeviceType::Kiosk,
        lifecycle: Device::Lifecycle::InService
      )
    end
  end
end
