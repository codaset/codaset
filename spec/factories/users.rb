FactoryGirl.define do
  factory :user do
    github_id { Faker::Number.number 5 }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
  end
end
