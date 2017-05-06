require 'rails_helper'

RSpec.describe OrganisationsController do
  before { sign_in user }

  let(:user) { create :user }

  describe 'GET #index' do
    let(:organisations) do
      create :organisation
      create :organisation, :with_members
      [
        create(:organisation, :with_member, user: user),
        create(:organisation, :with_member, user: user)
      ]
    end

    it 'assigns current users organisations as @organisations' do
      get :index
      expect(assigns(:organisations)).to eq(organisations)
    end
  end

  describe 'GET #show' do
    let(:organisation) { create :organisation, :with_member, user: user }

    it 'assigns the requested organisation as @organisation' do
      get :show, params: { id: organisation.to_param }
      expect(assigns(:organisation)).to eq(organisation)
    end

    context 'when current user is not a member of the requested organisation' do
      let(:organisation) { create :organisation }

      it 'raises a document not found exception' do
        expect do
          get :show, params: { id: organisation.to_param }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end
  end

  describe 'GET #new' do
    it 'assigns a new organisation as @organisation' do
      get :new, params: {}
      expect(assigns(:organisation)).to be_a_new(Organisation)
    end
  end

  describe 'GET #edit' do
    let(:organisation) { create :organisation, :with_member, user: user }

    it 'assigns the requested organisation as @organisation' do
      get :edit, params: { id: organisation.to_param }
      expect(assigns(:organisation)).to eq(organisation)
    end

    context 'when current user is not a member of the requested organisation' do
      let(:organisation) { create :organisation }

      it 'raises a document not found exception' do
        expect do
          get :edit, params: { id: organisation.to_param }
        end.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:attributes) { attributes_for :organisation }

      it 'creates a new Organisation' do
        expect do
          post :create, params: { organisation: attributes }
        end.to change(Organisation, :count).by(1)
      end

      it 'assigns a newly created organisation as @organisation' do
        post :create, params: { organisation: attributes }
        expect(assigns(:organisation)).to be_a(Organisation)
      end

      it 'persists a newly created organisation as @organisation' do
        post :create, params: { organisation: attributes }
        expect(assigns(:organisation)).to be_persisted
      end

      it 'assigns the current user as the one and only owner or the organisation' do
        post :create, params: { organisation: attributes }
        expect(assigns(:organisation).owners).to eq([user])
      end

      it 'redirects to the created organisation' do
        post :create, params: { organisation: attributes }
        expect(response).to redirect_to(Organisation.last)
      end
    end

    context 'with invalid params' do
      let(:attributes) { { name: '' } }

      it 'assigns a newly created but unsaved organisation as @organisation' do
        post :create, params: { organisation: attributes }
        expect(assigns(:organisation)).to be_a_new(Organisation)
      end

      it "re-renders the 'new' template" do
        post :create, params: { organisation: attributes }
        expect(response).to render_template('new')
      end
    end
  end

  xdescribe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested organisation' do
        organisation = Organisation.create! valid_attributes
        put :update, params: { id: organisation.to_param, organisation: new_attributes }
        organisation.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested organisation as @organisation' do
        organisation = Organisation.create! valid_attributes
        put :update, params: { id: organisation.to_param, organisation: valid_attributes }
        expect(assigns(:organisation)).to eq(organisation)
      end

      it 'redirects to the organisation' do
        organisation = Organisation.create! valid_attributes
        put :update, params: { id: organisation.to_param, organisation: valid_attributes }
        expect(response).to redirect_to(organisation)
      end
    end

    context 'with invalid params' do
      it 'assigns the organisation as @organisation' do
        organisation = Organisation.create! valid_attributes
        put :update, params: { id: organisation.to_param, organisation: invalid_attributes }
        expect(assigns(:organisation)).to eq(organisation)
      end

      it "re-renders the 'edit' template" do
        organisation = Organisation.create! valid_attributes
        put :update, params: { id: organisation.to_param, organisation: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  xdescribe 'DELETE #destroy' do
    it 'destroys the requested organisation' do
      organisation = Organisation.create! valid_attributes
      expect do
        delete :destroy, params: { id: organisation.to_param }
      end.to change(Organisation, :count).by(-1)
    end

    it 'redirects to the organisations list' do
      organisation = Organisation.create! valid_attributes
      delete :destroy, params: { id: organisation.to_param }
      expect(response).to redirect_to(organisations_url)
    end
  end
end
