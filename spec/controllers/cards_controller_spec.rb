require 'rails_helper'

RSpec.describe CardsController do
  let(:user) { create :user }
  let(:organisation) { create :organisation, :with_member, user: user }
  let(:card) { create :card, organisation: organisation }

  before { sign_in user }

  describe 'GET #index' do
    let(:cards) do
      create :card
      create_list(:card, 2, organisation: organisation)
    end

    it 'assigns the requested organisation as @organisation' do
      get :index, params: { organisation_id: organisation.to_param }
      expect(assigns(:organisation)).to eq(organisation)
    end

    it 'assigns current organisations cards as @cards' do
      get :index, params: { organisation_id: organisation.to_param }
      expect(assigns(:cards)).to eq(cards)
    end
  end

  describe 'GET :show' do
    context 'when account does not exist' do
      it 'raises a document not found exception' do
        expect do
          get :show, params: { organisation_id: 'no_user', id: 1 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when card does not exist' do
      it 'raises a document not found exception' do
        expect do
          get :show, params: { organisation_id: organisation.to_param, id: 1 }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when current_user is not a member of the organisation' do
      let(:organisation) { create :organisation, :with_member }

      it 'raises a document not found exception' do
        expect do
          get :show, params: { organisation_id: organisation.to_param, id: card.to_param }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    it 'renders the show template' do
      get :show, params: { organisation_id: organisation.to_param, id: card.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new card as @card' do
      get :new, params: { organisation_id: organisation.to_param }
      expect(assigns(:card)).to be_a_new(Card)
    end
  end
end
