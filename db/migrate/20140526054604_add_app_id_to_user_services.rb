class AddAppIdToUserServices < ActiveRecord::Migration
  def change
    add_column :user_services, :app_id, :integer
  end
end
