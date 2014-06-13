module Corgi
  class Friend < ActiveRecord::Base
    # has_paper_trail
    belongs_to :user
    belongs_to :friend_user, class_name: 'User', foreign_key: 'friend_user_id'
    validates_presence_of :friend_user_id, :user_id
    @queue = 'auth2'
    
    def self.perform(authentication_id, reconnected=false)
      authentication = Authentication.find authentication_id
      provider = authentication.provider
      uids = Authentication.find_social_friends authentication
      auths = Authentication.match_existed_auths authentication, uids
      Authentication.reconnect_my_friends(authentication, auths, !reconnected)
      Authentication.add_me_to_friends_and_notify_them(authentication, auths, !reconnected)
    end
  end
end

