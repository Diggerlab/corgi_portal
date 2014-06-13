class CreateCorgiBuildVersions < ActiveRecord::Migration
  def change
    create_table :corgi_build_versions do |t|
      t.integer :base_build
      t.integer :latest_build
      t.string :publisher
      t.string :latest_version
      t.text :latest_description
      t.string :latest_url
      t.timestamp :published_at

      t.timestamps
    end
  end
end
