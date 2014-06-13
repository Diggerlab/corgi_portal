module Corgi
  module V1
    class RechargesController < Corgi::V1::ApplicationController
      before_action :authenticated?
      def index
        @product = Product.where(enabled: true)
      end
    #params
    #token and transaction_receipt
      def create
        begin
          checksum = Digest::MD5.hexdigest params[:transaction_receipt]
          if Recharge.where(checksum: checksum, state: 'compeleted').exists?
            render status: 400, json: {message: 'receipt has compeleted', code: '1005'}
          else
            @recharge = current_user.recharges.create!(receipt_data: params[:transaction_receipt], 
              checksum: checksum, state: 'pending')
            @recharge.process!
            render status: 200, json: {code: '200', vcs: current_user.account.vcs}
          end
        rescue => e
          render status: 400, json: { message: "[RechargesController#create] server error: #{e.message}", code: '1000' }
        end
      end
    end
  end
end