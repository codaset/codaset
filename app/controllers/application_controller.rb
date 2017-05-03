class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from Mongoid::Errors::DocumentNotFound, with: :render_404

  def new_session_path
    new_user_session_path
  end
end
