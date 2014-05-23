class AppsController < ApplicationController
  def new
    @app = App.new
  end

  def create
    @app = App.create!(app_params)
  end

  private
    def app_params
      params.permit(:id, :user_id, :name, :net_address, :category, 
        :platform, :created_at)
    end
end
