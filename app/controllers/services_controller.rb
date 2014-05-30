class ServicesController < ApplicationController
  before_action :authenticate_user!
  def new
    @app = App.find params[:app_id]
    @services = Service.all
    @user_service = UserService.new 
  end

end
