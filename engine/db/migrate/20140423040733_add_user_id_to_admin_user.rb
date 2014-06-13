class AddUserIdToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :user_id, :integer, :default => 1
  end
end
