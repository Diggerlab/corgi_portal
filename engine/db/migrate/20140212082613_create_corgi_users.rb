class CreateCorgiUsers < ActiveRecord::Migration
  def change
    create_table :corgi_users do |t|
      t.string :email
      t.string :password
      t.string :state
      t.string :authentication_token
      t.string :role
      t.time :authentication_token_updated_at

      t.timestamps
    end
  end
end