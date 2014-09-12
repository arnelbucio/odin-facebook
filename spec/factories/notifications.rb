# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user nil
    resource nil
    action "MyString"
    seen false
  end
end
