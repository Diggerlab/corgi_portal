class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :www
      t.string :category
      t.string :platform
      t.references :user, index: true

      t.timestamps
    end
  end
end
