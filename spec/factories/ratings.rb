# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    product nil
    customer nil
    rating { rand(1..10) }
    text { Faker::Lorem.sentence }
  end
end
