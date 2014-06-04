class AccountsController < ApplicationController
  def show
    @user = current_user
    render "users/show"
  end


end 
