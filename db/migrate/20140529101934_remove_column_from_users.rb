class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :company
    remove_column :users, :contact_email
  end
end
