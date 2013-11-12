# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Claudiu"
    email 'claudiu.garba@gmail.com'
    password 'qwe123'
    password_confirmation 'qwe123'
    is_admin :true
  end
end
