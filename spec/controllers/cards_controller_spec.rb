require 'rails_helper'

RSpec.describe CardsController do
  let(:user) { create :user, :github_test }
  let(:card) { create :card, accountable: user }

  before { sign_in user }

  describe 'GET :show' do
    context 'when account does not exist' do
      it 'raises a document not found exception' do
        expect do
          get :show, params: { account_id: 'no_user', id: 1 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when card does not exist' do
      it 'raises a document not found exception' do
        expect do
          get :show, params: { account_id: user.to_param, id: 1 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when current_user is also the accountable' do
      it 'does not raise a document not found exception' do
        expect do
          get :show, params: { account_id: user.to_param, id: card.to_param }
        end.not_to raise_error
      end
    end

    xcontext 'when current_user is a member of the accountable' do
      let(:account) { create :organisation }

      it 'does not raise a document not found exception' do
        expect do
          get :show, params: { account_id: account.to_param, id: card.to_param }
        end.not_to raise_error
      end
    end

    it 'renders the show template' do
      get :show, params: { account_id: user.to_param, id: card.to_param }
      expect(response).to render_template(:show)
    end
  end
end
