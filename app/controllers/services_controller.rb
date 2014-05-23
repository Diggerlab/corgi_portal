class ServicesController < ApplicationController
  def new
    @services = Service.all
    @user_service = UserService.new 
  end

end
