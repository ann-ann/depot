# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    price { rand(10..20) }
    quantity { rand(1..3) }
    association :order
    association :product
  end
end
