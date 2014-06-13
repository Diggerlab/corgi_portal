class CreateCorgiPasswordRequests < ActiveRecord::Migration
  def change
    create_table :corgi_password_requests do |t|
      t.string :ip
      t.string :email
      t.string :token
      t.string :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
