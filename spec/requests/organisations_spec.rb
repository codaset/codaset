require 'rails_helper'

RSpec.xdescribe 'Organisations', type: :request do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET /organisations' do
    it 'works! (now write some real specs)' do
      get organisations_path
      expect(response).to have_http_status(200)
    end
  end
end
