# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:name) { |n| "name#{n}" }
    password { Faker::Internet.password }
    client

    trait :discarded do
      discarded_at { Time.now.utc }
    end

    trait :super_admin do
      after(:build) { |user| user.add_role(:super_admin) }
    end

    trait :admin do
      after(:build) { |user| user.add_role(:admin) }
    end

    trait :member do
      after(:build) { |user| user.add_role(:member) }
    end
  end
end
