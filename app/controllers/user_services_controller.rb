class UserServicesController < ApplicationController
  def create
    @app = App.find(params[:app])
    params['service_ids'].each do |id|
      UserService.create!(user_id: current_user.id, service_id: id, app_id: @app.id)
    end
    redirect_to user_service_url
  end

  def index
    @user_services = UserService.where(user_id: current_user.id)
    @user = current_user
  end

  private
  def user_service_params
    params.permit(:id, :user_id, :service_id, :created_at)
  end
end
