FactoryBot.define do
  factory :event_participant do
    user { nil }
    event { nil }
    location { Faker::Address.city }
  end
end
