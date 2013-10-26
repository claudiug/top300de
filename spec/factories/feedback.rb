FactoryGirl.define do
  factory :feedback do
    name "feedback"
    email "mail@example.net"
    comment "this is lovely comment"
    pro "good"
    contra "bad"
  end
end