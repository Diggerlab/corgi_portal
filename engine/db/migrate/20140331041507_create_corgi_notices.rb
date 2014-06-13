class CreateCorgiNotices < ActiveRecord::Migration
  def change
    create_table :corgi_notices do |t|
      t.references :admin_user
      t.string :title
      t.boolean :enabled
      t.text :content
      t.timestamp :start_at
      t.timestamp :end_at
      t.timestamps
    end
    add_index :corgi_notices, :admin_user_id
  end
end
