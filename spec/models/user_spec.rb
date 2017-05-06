require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#organisations' do
    subject { create :user }

    let(:organisations) do
      create :organisation
      create :organisation, :with_members
      [
        create(:organisation, :with_members, members_count: 1, users: [subject]),
        create(:organisation, :with_members, members_count: 1, users: [subject])
      ]
    end

    its(:organisations) { is_expected.to eq(organisations) }
  end
end
