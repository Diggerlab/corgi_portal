class AppsController < ApplicationController
  def new
    @app = App.new
  end
  def show
    @app = App.find(params[:id])
  end

  def create
    @app = current_user.apps.create!(app_params)
    redirect_to update_services_url(app_id: @app.id)
  end

  def index
    @app = current_user.apps
  end

  def update
    @app = App.find(params[:id])
    @app.update_attributes(app_params)
    redirect_to apps
  end

  def edit
    @app = App.find(params[:id])
  end

  private
    def app_params
       params.require(:app).permit(:id, :user_id, :name, :www, :category, 
        :platform, :created_at)
    end
end
