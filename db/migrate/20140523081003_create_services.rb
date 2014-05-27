class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :code
      t.string :title
      t.string :state
      t.string :description
    end
  end
end
