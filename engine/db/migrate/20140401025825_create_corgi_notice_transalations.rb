class CreateCorgiNoticeTransalations < ActiveRecord::Migration
  def up
    Corgi::Notice.create_translation_table!({:title => :string, :content => :text
      }, { :migrate_data => true})
  end

  def down
    Corgi::Notice.drop_translation_table! :migrate_data => true
  end
end
