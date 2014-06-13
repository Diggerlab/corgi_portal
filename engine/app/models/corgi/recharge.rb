module Corgi
  class Recharge < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    # has_paper_trail
    belongs_to :user
    belongs_to :product
    after_update :deal_with_recharge

    def process!
      if slef.state == 'pending'
        attempts = 0
        result = []
        begin
          result = JOSN.parse RestClient.post(IAP_VERIFY_URL, {'receipt-data' => self.receipt_data }.to_json, 
            :content_type => :json, :accept => :json)
          if result['status'].to_s == '0'
            #success
            self.update_columns iap_quantity: result['receipt']['quantity'],
              iap_product_id: result['receipt']['product_id'],
              iap_transaction_id: result['receipt']['transaction_id'],
              iap_purchase_date: result['receipt']['purchase_date'],
              iap_original_transaction_id: result['receipt']['original_transaction_id'],
              iap_original_purchase_date: result['receipt']['original_purchase_date'],
              iap_app_item_id: result['receipt']['item_id'],
              iap_version_external_identifier: result['receipt']['unique_vendor_identifier'],
              iap_bid: result['receipt']['bid'],
              iap_bvrs: result['receipt']['bvrs'], state: 'processing'
          else
            raise ArgumentError.new("recharge receipt is invalid: ##{self.id.to_s} - #{result.to_yaml}")
          end
        rescue
          attempts += 1
          attempts > 2 ? raise : retry
        ensure
          self.update_columns verified_at: Time.now, verified_log: result.to_yaml
        end
      end
    end

    

    private
    def deal_with_recharge
      if self.state == 'processing' && self.state_was == 'pending'
        self.with_lock do
          product = Product.find_by(sk_product_id: self.iap_product_id)
          if product.blank?
            raise "product #{slef.iap_product_id} doesn't exist or off the market" and return
          else
            self.user.account.lock!.increment! :vcs, product.vcs_got
            self.update_columns vcs: product.vcs_got, product_id: product.id, state: 'completed'
          end
        end
      end
    end
  end
end

