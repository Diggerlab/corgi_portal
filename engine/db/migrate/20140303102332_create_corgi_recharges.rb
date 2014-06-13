class CreateCorgiRecharges < ActiveRecord::Migration
  def change
    create_table :corgi_recharges do |t|
      t.string :state
      t.integer :vcs
      t.integer :iap_quantity
      t.string :iap_product_id
      t.string :iap_transaction_id
      t.datetime :iap_purchase_date
      t.string :iap_original_transaction_id
      t.datetime :iap_original_purchase_date
      t.string :iap_app_item_id
      t.string :iap_version_external_identifier
      t.string :iap_bid
      t.string :iap_bvrs
      t.text :receipt_data
      t.string :checksum
      t.datetime :verified_at
      t.text :verified_log
      t.references :user, :product, index: true

      t.timestamps
    end
  end
end
