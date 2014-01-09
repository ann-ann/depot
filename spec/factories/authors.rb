require 'faker'

FactoryGirl.define do
  factory :author do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    biography Faker::Lorem.paragraph 
    photo "#{Faker::Lorem.words(1)}.jpg"
  end
end
