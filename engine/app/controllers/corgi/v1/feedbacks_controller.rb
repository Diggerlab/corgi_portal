module Corgi
  module V1
    class FeedbacksController < Corgi::V1::ApplicationController
      before_action :authenticated?, only: [:new, :show, :index]
      respond_to :json, :html
      def index
         @feedbacks = current_user.feedbacks.order('created_at DESC')
      end

      def new
        @ip = request.env['REMOTE_ADDR']
        @feedbacks = current_user.feedbacks.order('created_at DESC')
        @token = current_user.authentication_token
      end

      def create
        @user = User.find_by(:authentication_token => params[:feedback][:token])
        ip = params[:feedback][:ip]
        @feedback = Feedback.new(:ip => ip, :content => params[:feedback][:content], :contact => params[:feedback][:contact], :user_id => @user.id)
        @feedback.save!
        redirect_to :action => 'new', :token => @user.authentication_token 
      end

    end
  end
end