FactoryBot.define do
  factory :view do
    user
    client
    viewable { "" }
  end
end
