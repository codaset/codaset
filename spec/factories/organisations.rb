FactoryGirl.define do
  factory :organisation do
    name { Faker::Company.name }

    trait :with_members do
      transient do
        members_count 2
        users { create_list(:user, members_count) }
      end

      after(:build) do |org, evaluator|
        evaluator.members_count.times do |i|
          membership = FactoryGirl.attributes_for(:membership, user_id: evaluator.users[i].id)
          org.memberships.build membership
        end
      end
    end

    trait :with_member do
      transient do
        user { create :user }
      end

      after(:build) do |org, evaluator|
        org.memberships.build FactoryGirl.attributes_for(:membership, user_id: evaluator.user.id)
      end
    end

    trait :with_owner do
      transient do
        user { create :user }
      end

      after(:build) do |org, evaluator|
        org.memberships.build FactoryGirl.attributes_for(:ownership, user_id: evaluator.user.id)
      end
    end
  end
end
