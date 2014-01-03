# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    password "MyString"
  end
end
