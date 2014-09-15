FactoryGirl.define do
  factory :user, aliases: [:friend] do
    sequence(:name, 'A') { |n| "User#{n}" }
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
