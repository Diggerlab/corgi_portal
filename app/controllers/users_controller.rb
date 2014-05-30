class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    redirect_to new_user_profile_url(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to apps_url
  end


  private
    def user_params
      params.require(:user).permit(:id, :email, :password, :re_password, :created_at)
    end
end