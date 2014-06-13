class DropCorgiVersionsTable < ActiveRecord::Migration
  def up
    drop_table :corgi_versions
  end
end
