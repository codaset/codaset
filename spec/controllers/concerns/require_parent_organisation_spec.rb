require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'RequireParentOrganisation concern', type: :controller do
  controller do
    include RequireParentOrganisation

    def show
      render plain: 'ok', status: 200
    end
  end

  before do
    sign_in user
    routes.draw { get 'show/:organisation_id' => 'anonymous#show' }
  end

  let(:user) { create :user }
  let(:organisation) { create :organisation, :with_member, user: user }

  it 'assigns the requested organisation as @organisation' do
    get :show, params: { organisation_id: organisation.to_param }
    expect(assigns(:organisation)).to eq(organisation)
  end

  context 'when current_user is not a member of the organisation' do
    let(:organisation) { create :organisation, :with_member }

    it 'raises a document not found exception' do
      expect do
        get :show, params: { organisation_id: organisation.to_param }
      end.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end
end
