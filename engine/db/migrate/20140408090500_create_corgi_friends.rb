class CreateCorgiFriends < ActiveRecord::Migration
  def change
    create_table :corgi_friends do |t|
      t.string :provider
      t.integer :friend_user_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
