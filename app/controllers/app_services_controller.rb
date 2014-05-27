class AppServicesController < ApplicationController
  def create
    @app = App.find(params['app'])
    params['service_ids'].each do |id|
      AppService.create!(service_id: id, app_id: @app.id)
    end
    redirect_to app_app_services_url, app_id: @app.id
  end

  def edit
    @app_service = AppService.find(params[:id])
  end

  def index
    @app_service = AppService.where(app_id: params[:app_id])
    @app = App.find(params[:app_id])
  end

  def new
    @app = App.find(params[:app_id])
    @app_service = AppService.new
    @services = Service.all
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
