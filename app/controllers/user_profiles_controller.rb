class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new(user_id: params[:user_id])
  end

  def create
    @user_profile = UserProfile.create!(user_profile_params)
  end


  private
    def user_profile_params
      params.require(:user_profile).permit(:id, :user_id, :company, :email, :telephone, :created_at)
    end
end