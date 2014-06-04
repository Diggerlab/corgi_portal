class AppServicesController < ApplicationController
  before_action :authenticate_user!
  def create
    @app = App.find(params['app_id'])
    AppService.auth_service(@app, params['service_ids'])
    redirect_to root_path

  end

  def update

  end

  def index

  end

  def new
    @app = App.find(params[:app_id])
    @app_service = AppService.new
    if @app.app_services.count != 0
      @services = AppService.auth_service(@app)
    else
      @services = Service.all
    end
  end

  def destroy
    @app_service = AppService.find(params[:id])
    @app_service.destroy
    redirect_to app_app_services_url, app_id: params[:app_id]
  end

  private
  def user_service_params
    params.permit(:id, :app_id, :service_id, :created_at)
  end
end
