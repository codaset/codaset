FactoryGirl.define do
  factory :user do
    github_id { Faker::Number.number 5 }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }

    trait :github_test do
      username { test_github_login }
      github_access_token { test_github_token }
    end
  end
end
