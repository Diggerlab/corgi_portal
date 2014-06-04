class UpdateProfiles < ActiveRecord::Migration
  def up
    rename_table :user_profiles, :profiles
    add_column :profiles, :realname, :string, null: false
    add_column :profiles, :title, :string
    add_column :profiles, :qq, :string
    add_column :profiles, :www, :string
    add_column :profiles, :address, :string
    add_column :profiles, :mobile, :string

    change_column :profiles, :company, :string, null: false
    add_index :profiles, :user_id
  end

  def down
    remove_index :profiles, :user_id
    remove_column :profiles, :realname
    remove_column :profiles, :title
    remove_column :profiles, :qq
    remove_column :profiles, :www
    remove_column :profiles, :address
    remove_column :profiles, :mobile
    rename_table :profiles, :user_profiles
  end
end
