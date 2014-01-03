# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    product nil
    customer nil
    rating 1
    text "MyText"
  end
end
