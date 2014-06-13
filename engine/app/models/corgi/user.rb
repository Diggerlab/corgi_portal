module Corgi
  require 'bcrypt'
  class User < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    # has_paper_trail
    validates_presence_of :email, :password
    validates :email, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
    validates :password, length: { minimum: 6}
    has_many :password_requests
    has_many :authentications
    has_many :feedbacks
    has_many :responses
    has_many :recharges
    has_one :account
    has_many :friends
    has_one :user_code

    before_create :init_user
    after_create :create_account
    after_create :create_code
    include BCrypt

     def self.authentication_user!(email,password)
      @user = User.find_by email: email
      raise 'email is wrong' unless @user
      hashed_pass = Password.new(@user.password)
      if hashed_pass == password
        return @user
      else
        raise 'password is wrong'
      end
    end

    def self.authentication_password(user, old_pass)
      raise 'password erro' unless BCrypt::Password.new(user.password) == old_pass
      return true
    end

    def self.default_user(provider, token)
      auth = Authentication.find_by(token: "#{token}", provider: provider)
      unless (auth && @user = auth.user)
        @user = User.new
        prefix = BCrypt::Password.create(Time.now.to_s)
        @user.email = "u#{prefix}@fake-email.com"
        @user.password = prefix
        @user.save!
      end
      @user
    end


    private

    def init_user
       self.authentication_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
       self.authentication_token_updated_at = Time.now
       self.password = BCrypt::Password.create(self.password)
       self.state = 'pending'
       self.role = 'user'
    end

    def create_account
      Account.create(user_id: self.id, vcs: 20, coins: 1700)
    end

    def create_code
      code = "u#{Array.new(7){[*2..9, *'a'..'h', *'j'..'k', *'m'..'n', *'p'..'z'].sample}.join}"
      UserCode.create(user_id: self.id, code: code)
    end
  end
end
 
