class AccountsController < ApplicationController
  def show
    # slug = Slug.find_by!(slug: "/#{params[:id]}")
    # slug_name = slug.sluggable_type.downcase
    # instance_variable_set "@#{slug_name}", slug.sluggable
    # render "#{slug_name}s/show"
  end
end
