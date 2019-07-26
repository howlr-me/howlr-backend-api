# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    client
    user
    name { 'MyString' }
    location { 'MyString' }
    details { 'MyString' }
    start_date { '' }
    end_date { '' }
    available_places { '' }
    image_url { '' }
  end
end
