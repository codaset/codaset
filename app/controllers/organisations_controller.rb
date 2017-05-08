class OrganisationsController < ApplicationController
  semantic_breadcrumb 'Organisations', :organisations_path

  before_action :authenticate_user!
  before_action :set_organisation, only: %i[show edit update destroy]

  # GET /organisations
  def index
    @organisations = current_user.organisations
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # POST /organisations
  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      redirect_to @organisation, notice: 'Organisation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /organisations/1
  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation, notice: 'Organisation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /organisations/1
  def destroy
    @organisation.destroy
    redirect_to organisations_url, notice: 'Organisation was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = current_user.organisations.find(params[:id])
      semantic_breadcrumb @organisation, @organisation
    end

    # Only allow a trusted parameter "white list" through.
    def organisation_params
      params.require(:organisation).permit(:name).tap do |o|
        o[:memberships_attributes] = [{ user_id: current_user.id, access_level: 'owner' }]
      end
    end
end
