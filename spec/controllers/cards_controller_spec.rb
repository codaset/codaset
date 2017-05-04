require 'rails_helper'

RSpec.describe CardsController do
  let(:account) { create :user }
  let(:card) { create :card, accountable: account }

  describe 'GET /:account/:id' do
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
          get :show, params: { account_id: account.to_param, id: 1 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    it 'renders the show template' do
      get :show, params: { account_id: account.to_param, id: card.to_param }
      expect(response).to render_template(:show)
    end
  end
end
