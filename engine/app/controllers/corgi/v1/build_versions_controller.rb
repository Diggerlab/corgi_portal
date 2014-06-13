module Corgi
  module V1
    class BuildVersionsController < Corgi::V1::ApplicationController
      respond_to :json
      def index
        @version = BuildVersion.find_by(:publisher => params[:publisher])
        @force_update = (params[:build].to_i < @version.base_build)
      end
    end
  end
end
