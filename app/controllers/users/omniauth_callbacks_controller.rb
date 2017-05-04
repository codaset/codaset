class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.find_or_create_from_auth_hash(auth_hash)
    if user.persisted?
      sign_in_and_redirect user
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      # session['devise.github_data'] = auth_hash
      set_flash_message(:alert, :failure, kind: 'Github')
      redirect_to root_url
    end
  end

  def failure
    set_flash_message(:alert, :failure, kind: 'Github')
    redirect_to root_path
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end
