# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    user nil
    friend nil
    status "MyString"
  end
end
