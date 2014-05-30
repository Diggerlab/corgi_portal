class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :company
      t.string :telephone
      t.integer :user_id
    end
  end
end
