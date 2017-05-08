FactoryGirl.define do
  factory :card do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraphs.join("\n\n") }

    association :organisation
    association :creator, factory: :user

    trait :closed do
      closed true
    end
  end
end
