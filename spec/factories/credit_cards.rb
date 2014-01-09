FactoryGirl.define do
  factory :credit_card do
    number "1234567890123456"
    cvv 123
    exp_m 10
    exp_y 2016
    fname Faker::Name.first_name
    lname Faker::Name.last_name
    order nil
    factory :current_year_expiration_card do
      exp_y Date.today.strftime("%Y").to_i
    end
  end
end
