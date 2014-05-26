class AppServicesController < ApplicationController
  def create
    @app = App.find(params['app'])
    params['service_ids'].each do |id|
      AppService.create!(service_id: id, app_id: @app.id)
    end
  end

  def edit
    @app_service = AppService.find(params[:id])
  end
  def index
    @app_service = AppService.all
  end
  def new
    @app = App.find(params[:app_id])
    @app_service = AppService.new
    @services = Service.all
  end

  private
  def user_service_params
    params.permit(:id, :app_id, :service_id, :created_at)
  end
end
