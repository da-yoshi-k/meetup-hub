FactoryBot.define do
  factory :event_participant do
    association :user
    association :event
    location { Faker::Address.city }
  end
end
