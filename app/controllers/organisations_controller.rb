class OrganisationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organisations = octokit.organizations
  end

  private

    def octokit
      @octokit ||= Octokit::Client.new(access_token: current_user.github_access_token)
    end
end
