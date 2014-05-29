class CreateServiceFunctions < ActiveRecord::Migration
  def change
    create_table :service_functions do |t|
      t.string :title
      t.string :api
      t.integer :service_id
      t.string :instruction
    end
  end
end
