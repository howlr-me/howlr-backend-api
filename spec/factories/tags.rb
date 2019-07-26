# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { 'MyString' }
    bg_color_hex { 'MyString' }
    importance_score { 0 }
    client
  end
end
