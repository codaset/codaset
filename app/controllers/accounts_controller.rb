class AccountsController < ApplicationController
  before_action :authenticate_user!, :set_account

  def show
    account_type_name = @account._type.downcase
    instance_variable_set "@#{account_type_name}", @account
    render "#{account_type_name}s/show"
  end

  private

    def set_account
      @account = Account.find_by(username: params[:id])
    end
end
