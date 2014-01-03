require 'faker'
FactoryGirl.define do
    sequence :title do |n|
    "#{Faker::Lorem.sentence}"
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

    factory :low_case_title_product do
      title "#{a{ FactoryGirl.generate(:title) }}"
    end

  end




end
