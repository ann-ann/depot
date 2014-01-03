# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    total_price ""
    state "MyString"
    completed_at "MyString"
    bill_address "MyString"
    ship_address "MyString"
  end
end
