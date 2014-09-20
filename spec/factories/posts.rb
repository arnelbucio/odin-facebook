FactoryGirl.define do
  factory :post do
    user
    association :content, factory: :text_post
  end
end
