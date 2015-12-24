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
end
