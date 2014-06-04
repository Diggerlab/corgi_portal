class UsersController < Devise::RegistrationsController
  layout 'application', only: ['new']
  def create
    build_resource user_params
    sign_up :user, resource
    resource = warden.authenticate!(user_params)
    sign_in :user, resource
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end
end
