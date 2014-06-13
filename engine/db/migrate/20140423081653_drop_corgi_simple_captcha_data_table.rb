class DropCorgiSimpleCaptchaDataTable < ActiveRecord::Migration
  def up
    drop_table :corgi_simple_captcha_data
  end

end
