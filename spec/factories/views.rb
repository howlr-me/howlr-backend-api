# frozen_string_literal: true

FactoryBot.define do
  factory :view do
    user
    client
    viewable { '' }
  end
end
