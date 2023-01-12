# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.name }
    age { Faker::Number.between(from: 1, to: 100) }
    bio { Faker::Lorem.sentence }
  end
end
