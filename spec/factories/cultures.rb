# frozen_string_literal: true

FactoryBot.define do
  factory :culture do
    sequence(:name) { |n| "#{Faker::Beer.name} #{n}" }
    client
  end
end
