module Corgi
  module V1
    class SessionsController < Corgi::V1::ApplicationController
      respond_to :json, :html

      def sina_callback
        client = Oauth2China::Sina.new(params[:weibo_access_token]) 
        uid = client.get_uid.uid
        info = client.users_show uid
        if uid
          @auth = Authentication.apply_oauth provider: 'sina', uid: uid, nickname: info.name, token: params[:weibo_access_token], expires_in_sec: params[:expires_in_sec]
        
          render 'corgi/v1/sessions/create'
        else
          render status: 401, json: { message: "Invalid credential." }
        end
      end

      def qq_callback
        client = Oauth2China::QQ.new(params[:weibo_access_token], params[:client_id], params[:open_id])
        info = client.get_inform
        nickname = info.nickname  
        if nickname
          @auth = Authentication.apply_oauth provider: 'qq', client: params[:client_id], open: params[:open_id], nickname: nickname, token: params[:weibo_access_token], expires_in_sec: params[:expires_in_sec]
          render 'corgi/v1/sessions/create'
        else
          render status: 401, json: { message: "Invalid credential." }
        end
      end

    end
  end
end
