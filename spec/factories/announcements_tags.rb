# frozen_string_literal: true

FactoryBot.define do
  factory :announcements_tag do
    announcement
    tag
  end
end
