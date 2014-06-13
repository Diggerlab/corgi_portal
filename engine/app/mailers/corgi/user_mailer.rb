module Corgi
  class UserMailer < ActionMailer::Base
    #default from: "from@example.com"
    def send_email(senddata)
      @password_request = senddata
      @url = MAIL_URL + "/?token=#{@password_request.token}"
      mail(to: @password_request.email, subject: 'Welcome')
    end
  end
end
