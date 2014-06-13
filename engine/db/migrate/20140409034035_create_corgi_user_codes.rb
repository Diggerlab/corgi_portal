class CreateCorgiUserCodes < ActiveRecord::Migration
  def change
    create_table :corgi_user_codes do |t|
      t.string :code
      t.references :user, index: true
    end
  end
end
