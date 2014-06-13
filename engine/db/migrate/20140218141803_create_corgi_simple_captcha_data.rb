class CreateCorgiSimpleCaptchaData < ActiveRecord::Migration
  def self.up
    create_table :corgi_simple_captcha_data do |t|
      t.string :key, :limit => 40
      t.string :value, :limit => 6
      t.timestamps
    end
    
    add_index :corgi_simple_captcha_data, :key, :name => "idx_key"
  end

  def self.down
    drop_table :corgi_simple_captcha_data
  end
end
