module Corgi
  module V1
    class FriendsController < Corgi::V1::ApplicationController
      respond_to :json, :html
      before_action :authenticated?
      def create
        if params[:email]
          friend_user = User.find_by email: params[:email]
        elsif params[:code]
          user_code = UserCode.find_by code: params[:code]
          friend_user = user_code.user
        end
        provider = params[:email].blank? ? :code : :email
        @friend = current_user.friends.create!(friend_user: friend_user, provider: provider)
      end

      def index
        @friends = current_user.friends
      end

      def import
        @friends = []
        User.where(email: params[:friends].split(',').map{|email| email.strip}).each do |friend|
          @friends << current_user.friends.create(friend_user: friend)
        end
      end
    end
  end
end
