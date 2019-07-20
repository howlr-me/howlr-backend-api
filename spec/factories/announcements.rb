FactoryBot.define do
  factory :announcement do
    user
    title { "MyString" }
    details { "MyString" }
    discarded_at { "2019-07-02 22:12:35" }
  end
end
