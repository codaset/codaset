class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :card_context

  def new_session_path
    new_user_session_path
  end

  def card_context
    @card_context ||= begin
      context_as_project || context_as_organisation || context_as_user || current_user
    end
  end

  protected

    def octokit
      @octokit ||= Octokit::Client.new(access_token: current_user.github_access_token)
    end

  private

    def context_as_project
      @context_as_project ||= begin
        instance_variable_defined?(:@project) && !@project.new_record? && @project
      end
    end

    def context_as_organisation
      @context_as_organisation ||= begin
        instance_variable_defined?(:@organisation) && !@organisation.new_record? && @organisation
      end
    end

    def context_as_user
      @context_as_user ||= instance_variable_defined?(:@user) && !@user.new_record? && @user
    end
end
