require 'faker'

FactoryGirl.define do
  factory :type do
    name Faker::Internet.domain_word
  end
end

