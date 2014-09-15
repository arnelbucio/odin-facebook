FactoryGirl.define do
  factory :comment do
    user
    content 'This is a comment'
    association :commentable
  end
end
