class UsersController < ApplicationController
  def profile
    raise ActionController::RoutingError.new('Not Found') unless user_signed_in?
    @projects = current_user.projects
  end
end
