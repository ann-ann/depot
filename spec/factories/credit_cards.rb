FactoryGirl.define do
  factory :credit_card do
    number "1234567890123456"
    cvv 123
    exp_m 10
    exp_y 2016
    fname "MyString"
    lname "MyString"
    order nil

  end
end
