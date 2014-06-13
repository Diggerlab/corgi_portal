# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recharge, class: Corgi::Recharge do
    state "MyString"
    vc 1
    created_at "2014-03-03 18:23:32"
    updated_at "2014-03-03 18:23:32"
    iap_quantity 1
    iap_product_id "MyString"
    iap_transaction_id "MyString"
    iap_purchase_date "2014-03-03 18:23:32"
    iap_original_transaction_id "MyString"
    iap_original_purchase_date "2014-03-03 18:23:32"
    iap_app_item_id "MyString"
    iap_version_external_identifier "MyString"
    iap_bid "MyString"
    iap_bvrs "MyString"
    receipt_data "MyText"
    checksum "MyString"
    verified_at "2014-03-03 18:23:32"
    verified_log "MyText"
    user nil
  end
end
