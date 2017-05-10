module OrganisationHelper
  def current_organisation
    @organisation && !@organisation.new_record? ? @organisation : nil
  end
end
