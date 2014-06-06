class AppsController < ApplicationController
  before_action :authenticate_user!
  def new
    @app = current_user.apps.new
    @user_services = Service.where(state: 'user')
  end
  def show
    @app = current_user.apps.find(params[:id])
    @app_services = @app.app_services
    
  end

  def create
    @app = current_user.apps.create!(app_params)
    AppService.auth_service(@app, params['service_ids'])
    redirect_to apps_url
  end

  def index
    @app = current_user.apps
    @service = Service.find_by(state: 'system')
  end

  def update
    @app = current_user.apps.find(params[:id])
    @app.update(app_params)
    AppService.auth_service(@app, params['service_ids'])
    redirect_to apps_path
  end

  def edit
    @app = current_user.apps.find(params[:id])
    @system_services = Service.where(state: 'system')
    @user_services = Service.where(state: 'user')
    @app_services = AppService.find_services(@app)
  end

  def service_details
    @app = current_user.apps.find(params[:id])
    @service = Service.find(params[:service_id]) 
    raise "there is no service" unless @app.app_services.find_by_service_id(params[:service_id])
    @service_functions = @service.service_functions
  end

  def remove
    select_ids =params[:ids].split(',')
    @app = App.where(id: select_ids)
    @app.each do |app|
      app.app_services.delete_all
      app.delete
    end
    redirect_to apps_url
  end

  def toggle_state
    select_ids =params[:ids].split(',')
    @app = App.where(id: select_ids)
    @app.each do |app|
      puts app.id
      app.toggle(:state)
      app.save
    end
    redirect_to apps_url
  end

  private
    def app_params
      params.require(:app).permit(:id, :user_id, :name, :www, :category, 
        :platform, :created_at, :state)
    end
end
