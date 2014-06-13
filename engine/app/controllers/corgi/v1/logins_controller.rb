module Corgi
  module V1
    class LoginsController < Corgi::V1::ApplicationController
      layout '/corgi/layouts/corgi/application'
      respond_to :json, :html
      def create
        @user = User.authentication_user!(params[:email],params[:password])
        @user.authentication_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
        @user.save!
      end

      def login
        @user = User.new
      end
    end
  end
end
