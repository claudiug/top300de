# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    name "trip"
    city "Berlin"
    zip_code 10367
    description "some stuff around"
    is_active true
    is_feature true
  end
end
