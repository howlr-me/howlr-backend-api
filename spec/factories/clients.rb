# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Company.name }
    webpage { Faker::Internet.domain_name }
    number_of_employees { Faker::Number.within(1..1000) }
  end
end
