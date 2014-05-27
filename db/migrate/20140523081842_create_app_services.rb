class CreateAppServices < ActiveRecord::Migration
  def change
    create_table :app_services do |t|
      t.integer :app_id
      t.integer :service_id
      t.string :state
      t.timestamps
    end
  end
end
