module Corgi
  module V1
    class NoticesController < Corgi::V1::ApplicationController
      respond_to :json
      def index
        muti_lag(params[:lag])
        @notices = Notice.live.order("start_at DESC").limit(10)
      end
    end
  end
end
