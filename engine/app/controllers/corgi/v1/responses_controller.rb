module Corgi
  module V1
    class ResponsesController < Corgi::V1::ApplicationController
      layout '/corgi/layouts/corgi/application'
      respond_to :json, :html
      def new
        @ip = request.env['REMOTE_ADDR']
        @feedback = Feedback.find_by(:id => params[:feedback_id])
        @responses = @feedback.responses
        @token = params[:token]
      end

      def create
        @user = User.find_by(:authentication_token => params[:response][:token])
        ip = params[:response][:ip]
        @response = Response.new(:ip => ip, :feedback_id => params[:response][:feedback_id],:content => params[:response][:content], :contact => @user.email, :user_id => @user.id)
        @response.save!
        redirect_to :action => 'new', :token => params[:response][:token]
      end
    end
  end
end
