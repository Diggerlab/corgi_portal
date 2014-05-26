class ServicesController < ApplicationController
  def new
    @app = App.find_by(name: params[:sitel])
    @services = Service.all
    @user_service = UserService.new 
  end

end
