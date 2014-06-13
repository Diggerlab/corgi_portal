module Corgi
  module V1
    class PasswordRequestsController < Corgi::V1::ApplicationController
      #forget password send email
      include SimpleCaptcha::ControllerHelpers
      respond_to :json, :html
      def new
        @password_request = PasswordRequest.new
      end
      #send email
      def create
        @password_request = PasswordRequest.new
        if simple_captcha_valid? 
          if @user = User.find_by(:email => params[:email])
            PasswordRequest.set_request(@password_request,@user)
            @password_request.ip = request.env['REMOTE_ADDR']
            UserMailer.send_email(@password_request).deliver if @password_request.save!
            render :text => 'email has sent'
          else
             raise 'the email is wrong'
          end
        else
          raise 'the captcha_valid is wrong'
        end
      end
      # get change_passeord
      def new_password
        raise 'the token has Expired' unless PasswordRequest.find_by(:token => params[:token], :state => 'pending')
        @password_request = PasswordRequest.find_by(:token => params[:token])
      end
      #post change_password
      def change_password
        if simple_captcha_valid? 
          current_request = PasswordRequest.find_by(:token => params[:password_request][:token])
          if current_request.state == 'pending'
            @user = current_request.user
            @user.password = BCrypt::Password.create(params[:change_password])
            current_request.state = 'finished' 
            @user.save!
            current_request.save!
            render :text => 'password has changed'
          else
            raise 'the link you have clicked if you want to change you password again, please click forget password!'
          end 
          
        else
          raise 'the captcha_valid is wrong'
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def request_params
        params.require(:password_request).permit(:id, :email, :ip, :token, :state, :user_id, :created_at)
      end
    end
  end
end
