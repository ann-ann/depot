require 'faker'
FactoryGirl.define do
    sequence :title do |n|
    "Title for product#{n}"
  end

  factory :product do
    title { FactoryGirl.generate(:title) }
    description Faker::Lorem.sentence
    image_url "ruby.png"
    price 10
    in_stock false

    factory :product_in_stock do
  	  in_stock true
    end

    factory :product_out_of_stock do
  	  in_stock false
    end
  end
end
