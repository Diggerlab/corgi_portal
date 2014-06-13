class AddColumnIntoFriend < ActiveRecord::Migration
  def change
    add_column :corgi_friends, :uid, :string
    add_column :corgi_friends, :friend_uid, :string
    add_column :corgi_friends, :authentication_id, :integer
    add_column :corgi_friends, :friend_authentication_id, :integer
    add_column :corgi_friends, :state, :string
  end
end
