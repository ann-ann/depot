# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    total_price nil
    state "in_progress"
    completed_at Date.today
    bill_address nil
    ship_address nil
    factory :order_with_items do
      ignore { order_items_count 3 }
      after :create do |order, evaluator|
        create_list :order_item, evaluator.order_items_count, order: order

      end
    end
  end
end

