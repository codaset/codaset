require 'rails_helper'

RSpec.describe OrganisationsController do
  before { sign_in create(:user) }

  # This should return the minimal set of attributes required to create a valid
  # Organisation. As you add validations to Organisation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganisationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all organisations as @organisations' do
      organisation = Organisation.create! valid_attributes
      get :index, params: {}
      expect(assigns(:organisations)).to eq([organisation])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested organisation as @organisation' do
      organisation = Organisation.create! valid_attributes
      get :show, params: { id: organisation.to_param }
      expect(assigns(:organisation)).to eq(organisation)
    end
  end

  describe 'GET #new' do
    it 'assigns a new organisation as @organisation' do
      get :new, params: {}
      expect(assigns(:organisation)).to be_a_new(Organisation)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested organisation as @organisation' do
      organisation = Organisation.create! valid_attributes
      get :edit, params: { id: organisation.to_param }
      expect(assigns(:organisation)).to eq(organisation)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Organisation' do
        expect do
          post :create, params: { organisation: valid_attributes }
        end.to change(Organisation, :count).by(1)
      end

      it 'assigns a newly created organisation as @organisation' do
        post :create, params: { organisation: valid_attributes }
        expect(assigns(:organisation)).to be_a(Organisation)
      end

      it 'persists a newly created organisation as @organisation' do
        post :create, params: { organisation: valid_attributes }
        expect(assigns(:organisation)).to be_persisted
      end

      it 'redirects to the created organisation' do
        post :create, params: { organisation: valid_attributes }
        expect(response).to redirect_to(Organisation.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved organisation as @organisation' do
        post :create, params: { organisation: invalid_attributes }
        expect(assigns(:organisation)).to be_a_new(Organisation)
      end

      it "re-renders the 'new' template" do
        post :create, params: { organisation: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
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

  describe 'DELETE #destroy' do
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
