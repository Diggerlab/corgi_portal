class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def new
    @user_profile = UserProfile.new(user_id: current_user.id)
  end

  def create
    @user_profile = UserProfile.create!(user_profile_params)
    redirect_to  new_app_path
  end


  private
    def user_profile_params
      params.require(:user_profile).permit(:id, :user_id, :company, :email, :telephone, :created_at)
    end
end