# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "Claudiu"
    address "paul zobel strasse 24"
    phone_number "151477845142"
    email "example@example.net"
    is_active true
    web_page 'www.google.de'

  end
end
