class CreateModules < ActiveRecord::Migration
  def change
    create_table :modules do |t|
      t.string :code
      t.string :title
      t.string :description
    end
  end
end
