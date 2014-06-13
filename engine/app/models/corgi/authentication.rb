module Corgi
  class Authentication < ActiveRecord::Base
    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
    # has_paper_trail

    validates_presence_of :user_id, :provider
    belongs_to :user
    after_create :connect_friends

    def self.apply_oauth(options={}) 
      User.transaction do 
        user = User.default_user(options[:provider], options[:token])
        @auth = user.authentications.find_or_initialize_by(:provider => options[:provider], :uid => options[:uid].to_s)
        case options[:provider]
        when 'qq'
          @auth.openid = options[:open]
          @auth.openkey = options[:client]
        end
        @auth.token = options[:token]
        @auth.token_secret = options[:token_secret]
        @auth.expired_at = Time.zone.now + options[:expires_in_sec].to_i
        @auth.save!
        @auth
      end
    end

    def self.find_social_friends(authentication)
      return [111, 222, 333] if Rails.env.test? 
      provider = authentication.provider
      token = authentication.token
      case provider
      when 'sina'
        client = Oauth2China::Sina.new(token)
        ids_hash = client.mutual_friends_ids
        ids_hash.blank? ? nil : ids_hash['ids']
      when 'qq'

      end
    end


    def self.match_existed_auths(authentication, uids)
      provider = authentication.provider
      auths = Authentication.joins(:user).where("corgi_users.state <> 'inactive'").where(provider: provider, uid: uids)
    end 

    def self.reconnect_my_friends(authentication, friend_auths, notice=true)
      provider = authentication.provider
      uid = authentication.uid
      user = authentication.user
      unless friend_auths.blank?
        Friend.where(provider: provider, uid: uid).delete_all 
        friend_auths.each do |friend_auth|
          user.friends.create! authentication_id: authentication.id, 
                              friend_user_id: friend_auth.user_id, 
                              friend_authentication_id: friend_auth.id,
                              provider: provider,
                              uid: uid,
                              friend_uid: friend_auth.uid,
                              state: 'connected'
        end
      end
    end

    def self.add_me_to_friends_and_notify_them(authentication, friend_auths, notice=true)
      provider = authentication.provider
      uid = authentication.uid
      Friend.where(provider: provider, friend_uid: uid).delete_all if friend_auths 
      friend_auths.each do |friend_auth|
        friend_auth.user.friends.create! authentication_id: friend_auth.id,
                                        friend_user_id: authentication.user_id,
                                        friend_authentication_id: authentication.id,
                                        provider: provider,
                                        uid: friend_auth.uid,
                                        friend_uid: uid,
                                        state: 'matched'
      end
    end

    private
    def connect_friends
      Corgi::V1::ApplicationController.helpers.perform_in_resque Friend, self.id.to_s
    end

  end
end

