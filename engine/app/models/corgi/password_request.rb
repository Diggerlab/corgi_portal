module Corgi
  class PasswordRequest < ActiveRecord::Base
    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

    # has_paper_trail
    belongs_to :user
    validates_presence_of :email

    def self.set_request(request,user)
      request.token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
      request.state = 'pending'
      request.email = user.email
      request.user_id = user.id 
    end
  end

end
