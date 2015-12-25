require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :city do
    name 'Bangkok'
    latitude 13.7563
    longitude 100.5018
  end

  factory :review do
    value 8
    beauty 8
    activities 8
    friendliness 8
    food 8
    touristy 8
    user
    city
  end
end
