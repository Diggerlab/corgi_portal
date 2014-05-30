class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def new
    @user_profile = UserProfile.new(user_id: current_user.id)
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = current_user.id
    @user_profile.save!
    redirect_to  new_app_path
  end

  def show
    @user_profile = current_user.user_profile
  end


  private
    def user_profile_params
      params.require(:user_profile).permit(:id, :user_id, :company, :telephone, :created_at)
    end
end