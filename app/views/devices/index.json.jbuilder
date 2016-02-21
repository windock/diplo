json.array!(@devices) do |device|
  json.extract! device, :id, :username, :device_type, :lifecycle, :email_enabled, :printer_enabled
  json.url device_url(device, format: :json)
end
