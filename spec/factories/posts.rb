FactoryGirl.define do
  factory :post do
    user
    sequence(:content) { |n| "Post content ##{n}" }
  end
end
