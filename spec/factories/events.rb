FactoryBot.define do
  factory :event do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    max_participants { 6 }
    priority_condition { Faker::Lorem.word }
    status { 0 }
  end
end
