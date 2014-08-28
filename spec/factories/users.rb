FactoryGirl.define do
  factory :user do
    sequence(:name, 'A') { |n| "User#{n}" }
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
