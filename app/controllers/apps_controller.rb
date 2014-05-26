class AppsController < ApplicationController
  def new
    @app = App.new
  end

  def create
    @app = App.create!(app_params)
    @user = @app.user
    redirect_to new_service_url(:sitel => @app.name)

  end

  private
    def app_params
      params.permit(:id, :user_id, :name, :net_address, :category, 
        :platform, :created_at)
    end
end
