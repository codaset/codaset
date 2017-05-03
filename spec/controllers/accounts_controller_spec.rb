require 'rails_helper'

RSpec.describe AccountsController do
  describe 'GET /:username' do
    context 'when account does not exist' do
      it 'raises a document not found exception' do
        expect do
          get :show, params: { id: 'no_user' }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when account is a User' do
      let(:account) { create :user }

      it 'renders the users/show template' do
        get :show, params: { id: account.username }
        expect(response).to render_template('users/show')
      end

      it 'assigns @user' do
        get :show, params: { id: account.username }
        expect(assigns(:user)).to eq(account)
      end
    end

    context 'when account is an Organisation' do
      let(:account) { create :organisation }

      it 'renders the organisations/show template' do
        get :show, params: { id: account.username }
        expect(response).to render_template('organisations/show')
      end

      it 'assigns @organisation' do
        get :show, params: { id: account.username }
        expect(assigns(:organisation)).to eq(account)
      end
    end
  end
end
