class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :re_password
      t.string :company
      t.string :contact_email

      t.timestamps
    end
  end
end
