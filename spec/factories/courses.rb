require 'faker'
FactoryGirl.define do
  factory :course do
    name Faker::Name.name
    subtitle Faker::Name.name
    description Faker::Name.name
    price 0.0
    deleted true
    active true
    association :category
    association :user
  end
end