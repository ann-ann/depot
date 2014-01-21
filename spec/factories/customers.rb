# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :customer do
    email Faker::Internet.email
    first_name Faker::Name.name
    last_name Faker::Name.name
    password "password"
    password_confirmation "password"
  end
end
