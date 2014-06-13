ActiveAdmin.register Corgi::Recharge do
  menu parent: 'Games'
  permit_params :id, :user_id, :product_id, :state, :vcs, :iap_quantity, :iap_purchase_date, :iap_original_purchase_date, :iap_version_external_identifier,
   :iap_bid, :iap_bvrs, :receipt_data

  filter :state
  filter :associated_product
  filter :gems
  filter :iap_purchase_date
  filter :created_at
  filter :updated_at
  filter :verified_at

  index do
    selectable_column

    column :id
    
    column :user
    column :product
    column :created_at
    column :checksum
    column :verified_at
    column :state
    
    default_actions 
  end
  
end
