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

    factory :product_with_ratings do
      ignore { ratings_count 5 }
      after :create do |product, evaluator|
        create_list :rating, evaluator.ratings_count, product: product
      end
    end

    factory :product_with_refs do
      ignore { order_items_count 3 } 
      after :create do |product, evaluator|
        create_list :order_item, evaluator.order_items_count, product: product
      end
    end

  end
end



