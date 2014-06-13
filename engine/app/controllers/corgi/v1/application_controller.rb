module Corgi
  module V1
    class ApplicationController < ActionController::Base
      layout 'corgi/layouts/corgi/application'
      include SimpleCaptcha::ControllerHelpers
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception
      helper_method :current_user

      rescue_from Exception, :with => :error_handler

      def authenticated?
        if params[:token] && user = User.find_by_authentication_token(params[:token])
          return true
        else
          raise "Unauth 401. Token invalid"
        end
      end

      def current_user
         @user ||= User.find_by_authentication_token(params[:token])
      end  

      def muti_lag(lag) 
        case lag
        when 'en'
          I18n.locale = :en
        when 'zn'
          I18n.locale = 'zh-CN'
        when 'ja'
          I18n.locale = :ja
        end
      end


      private
      def error_handler(e)
        if Rails.env.production? || Rails.env.staging? 
          begin
            ExceptionLog.create_from_exception self, e
            respond_to do |format|
              format.json { 
                render status: 400, json: { message: "#{e.message}", code: '1000' }
              }
              format.all  { render :nothing => true, :status => 400 }
            end 
          rescue 
            raise e  
          end
        else
          raise e
        end
      end

      protected

      # def user_for_paper_trail
      #   puts "@@@@@@"
      #   admin_user_signed_in? ? current_admin_user : 'Unknown user'
      # end
    end
  end
end
