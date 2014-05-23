class UserServicesController < ApplicationController
  def create
   @user_service = UserServices.create!(user_service_params)
  end

  private
  def user_service_params
    params.permit(:id, :user_id, :service_id, :created_at)
  end
end
