class AppServicesController < ApplicationController
  def create
    puts "here"
    @app = App.find(params['app'])
    params['service_ids'].each do |id|
      AppService.create!(user_id: current_user.id, service_id: id, app_id: @app.id)
    end
    puts params['app']
    #redirect_to user_service_url(:sitel => @app.name)
  end

  def index
    # @app = App.find_by(name: params[:sitel]
    # @user = current_user
    # @user_services = @user.user_services
  end

  private
  def user_service_params
    params.permit(:id, :user_id, :service_id, :created_at)
  end
end
