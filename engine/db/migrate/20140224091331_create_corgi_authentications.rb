class CreateCorgiAuthentications < ActiveRecord::Migration
  def change
    create_table :corgi_authentications do |t|
      t.string :provider
      t.string :token
      t.string :token_secret
      t.string :openid
      t.string :openkey
      t.string :refresh_token
      t.datetime :expired_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
