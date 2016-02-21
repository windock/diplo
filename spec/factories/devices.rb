FactoryGirl.define do
  factory :device do
    username "MyString"
    device_type 1
    lifecycle 1
    email_enabled false
    printer_enabled false
  end
end
