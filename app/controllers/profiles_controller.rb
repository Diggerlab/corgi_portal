class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit]

  def update
    current_user.profile.update_attributes! profile_params
    flash[:notice] = 'You profile has been updated successfully!'
    redirect_to profile_path
  end

  private
  def find_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:user_id, :company, :telephone, :realname, 
                                    :title, :qq, :www, :address, :mobile)
  end
end
