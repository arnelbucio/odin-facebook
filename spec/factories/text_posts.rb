FactoryGirl.define do
  factory :text_post do
    sequence(:content) { |n| "TextPost content ##{n}"}
  end
end
