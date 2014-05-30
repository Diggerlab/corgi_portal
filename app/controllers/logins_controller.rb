class LoginsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = User.authentication_user!(params[:user][:name],params[:user][:password])
    if params[:remember_me]
      cookies.permanent[:auth_token] = @user.auth_token 
    else
      cookies[:auth_token] = @user.auth_token 
    end
    if @user.apps.first == nil
      redirect_to new_app_url   
    else
      redirect_to apps_url
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
