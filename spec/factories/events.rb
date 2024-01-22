FactoryBot.define do
  factory :event do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    max_participants { 6 }
    priority_condition { Faker::Lorem.word }
    status { 0 }
    association :user
  end
end
