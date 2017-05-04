class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    account = Account.find_by(username: params[:id])
    account_type_name = account._type.downcase
    instance_variable_set "@#{account_type_name}", account
    render "#{account_type_name}s/show"
  end
end
