FactoryGirl.define do
  factory :card do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs.join("\n\n") }

    association :accountable
    association :creator, factory: :user
  end
end
