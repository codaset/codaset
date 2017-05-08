module RequireParentOrganisation
  extend ActiveSupport::Concern

  included do
    before_action :set_organisation
  end

  private

    def set_organisation
      @organisation = current_user.organisations.find(params[:organisation_id])
    end
end
