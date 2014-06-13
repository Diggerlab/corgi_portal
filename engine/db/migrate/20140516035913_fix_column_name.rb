class FixColumnName < ActiveRecord::Migration
  def up
    add_column :corgi_authentications, :uid, :string
  end
end
