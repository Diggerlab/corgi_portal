class LoginsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = User.authentication_user!(params[:name],params[:password])
    session[:user_id] = @user.id
    if @user.apps.first == nil
      redirect_to new_app_url   
    else
      redirect_to apps_url
    end
  end

end
