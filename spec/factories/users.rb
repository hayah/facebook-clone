FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    username "johndoe"
    password "foobar"
    phone_number "1234567"
    sequence(:email) { |n| "john#{n}@example.org" }
  end
end
