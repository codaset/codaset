require 'rails_helper'

RSpec.describe Organisation, type: :model do
  describe '#members' do
    subject { create :organisation, :with_members, users: users }

    let(:users) { create_list :user, 2 }

    its(:members) { is_expected.to eq(users) }
  end

  describe '#owners' do
    subject(:organisation) { create :organisation, :with_owner, user: user }

    before { organisation.memberships << build(:membership) }

    let(:user) { create :user }

    its(:owners) { is_expected.to eq([user]) }
  end
end
