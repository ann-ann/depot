# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address "MyString"
    zipcode "MyString"
    city "MyString"
    phone "MyString"
    order nil
    country nil
  end
end
