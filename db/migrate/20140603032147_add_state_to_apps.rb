class AddStateToApps < ActiveRecord::Migration
  def change
     add_column :apps, :state, :boolean
  end
end
