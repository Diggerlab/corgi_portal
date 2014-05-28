class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end


  private
    def user_params
      params.permit(:id, :name, :password, :re_password, :company, 
        :contact_email, :created_at)
    end
end
