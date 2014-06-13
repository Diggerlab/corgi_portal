class CreateCorgiAccounts < ActiveRecord::Migration
  def change
    create_table :corgi_accounts do |t|
      t.integer :vcs
      t.integer :coins
      t.references :user, index: true

      t.timestamps
    end
  end
end
