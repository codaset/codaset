FactoryGirl.define do
  factory :membership do
    access_level 'member'
    user_id { create(:user).id }

    factory :ownership do
      access_level 'owner'
    end
  end
end
