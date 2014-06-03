class AppsController < ApplicationController
  before_action :authenticate_user!
  def new
    @app = current_user.apps.new
  end
  def show
    @app = current_user.apps.find(params[:id])
    @service = Service.first
    @service_functions = @service.service_functions
  end

  def create
    @app = current_user.apps.create!(app_params)
    redirect_to app_app_services_url(app_id: @app.id)
  end

  def index
    @app = current_user.apps
    @service = Service.find_by(state: 'system')
  end

  def update
    @app = current_user.apps.find(params[:id])
    @app.update_attributes(app_params)
    redirect_to apps
  end

  def edit
    @app = current_user.apps.find(params[:id])
  end

  def service_details
    @app = current_user.apps.find(params[:id])
    @service = Service.find(params[:service_id]) 
    raise "there is no service" unless @app.app_services.find_by_service_id(params[:service_id])
    @service_functions = @service.service_functions
  end

  private
    def app_params
      params.require(:app).permit(:id, :user_id, :name, :www, :category, 
        :platform, :created_at)
    end
end
