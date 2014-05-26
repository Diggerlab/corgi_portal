class UserServicesController < ApplicationController
  def create
    params['service_ids'].each do |id|
      UserService.create!(user_id: current_user.id, service_id: id)
    end
   # @user_service = UserServices.create!(user_service_params)
  end

  private
  def user_service_params
    params.permit(:id, :user_id, :service_id, :created_at)
  end
end
