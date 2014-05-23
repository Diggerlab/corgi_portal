class LoginsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = User.authentication_user!(params[:name],params[:password])
  end
end
