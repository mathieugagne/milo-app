class UsersController < ApplicationController
  def profile
    raise ActionController::RoutingError.new('Not Found') unless user_signed_in?
    @projects = current_user.projects
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      redirect_to profile_path, alert: 'Oups. Something went wrong.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
