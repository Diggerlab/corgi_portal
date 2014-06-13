module Corgi
  module V1
    class UsersController < Corgi::V1::ApplicationController
      layout '/corgi/layouts/corgi/application'
      before_action :set_user, only: [:show, :edit, :update, :destroy]
      before_action :authenticated?, only: [:change_password]
      # GET /users
      # GET /users.json
      respond_to :json, :html
      def index
        @users = User.all
      end



      # GET /users/new
      def new
        @user = User.new
      end


      # POST /users
      # POST /users.json
      def create
        @user = User.create!(email: params[:email], password: params[:password])
        # @user.email = params[:email]
        # @user.password = params[:password]
        # @user.save!

      end

      def change_password
        @user = User.find_by(:authentication_token => params[:token])
      end

      def update_password
        if simple_captcha_valid?
          @user = current_user
          User.authentication_password(@user,params[:password])
          #raise "password is wrong" if params[:password] != @user.password
          @user.password = BCrypt::Password.create(params[:new_password])
          @user.save! 
          render :text => 'password has changed'
        else
          raise "code is wrong"
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def user_params
          params.require(:user).permit(:id, :email, :password, :state, :authentication_token, 
            :authentication_token_updated_at, :role, :created_at)
        end

        def set_user
          @user = User.find(params[:id])
        end
        # Never trust parameters from the scary internet, only allow the white list through.
    end
  end
end