class AppServicesController < ApplicationController
  def create
    @app = App.find(params['app'])
    AppService.auth_service(@app, params['service_ids'])
    redirect_to app_app_services_path(app_id: @app.id)
  end

  def update
    # @app = App.find(params['app'])
    # AppService.auth_service(@app, params['service_ids'])
    # redirect_to app_app_services_path(app_id: @app.id)
  end

  def index
    @app = App.find(params[:app_id])
    @exist_services = []
    @system_services = []
    unless @app.app_services.count == 0
      @app.app_services.each do |ser|
        if ser.service.state == 'system'
          @system_services << ser.service
        else
          @exist_services << ser.service 
        end
        
      end 
    end
    @services = Service.all - @exist_services -@system_services
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
