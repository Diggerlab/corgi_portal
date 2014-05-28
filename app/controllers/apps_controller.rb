class AppsController < ApplicationController
  def new
    @app = current_user.apps.new
  end
  def show
    @app = current_user.apps.find(params[:id])
  end

  def create
    @app = current_user.apps.create!(app_params)
    redirect_to app_app_services_url(app_id: @app.id)
  end

  def index
    @app = current_user.apps
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
    
  end

  private
    def app_params
      params.require(:app).permit(:id, :user_id, :name, :www, :category, 
        :platform, :created_at)
    end
end
