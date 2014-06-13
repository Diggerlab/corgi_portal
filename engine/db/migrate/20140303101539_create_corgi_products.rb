class CreateCorgiProducts < ActiveRecord::Migration
  def change
    create_table :corgi_products do |t|
      t.string :sk_product_id
      t.boolean :enabled
      t.integer :vcs_got
      t.float :gross
      t.string :short_name

      t.timestamps
    end
  end
end
