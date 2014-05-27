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

  private
    def app_params
      params.permit(:id, :user_id, :name, :net_address, :category, 
        :platform, :created_at)
    end
end
