class CreateCorgiFeedbacks < ActiveRecord::Migration
  def up
    create_table :corgi_feedbacks do |t|
      t.string :contact
      t.string :content, limit: 4000
      t.string :ip
      t.integer :responses_count
      t.timestamps
      t.references :user
    end

    create_table :corgi_responses do |t|
      t.string :contact
      t.string :content, limit: 4000
      t.string :ip
      t.timestamps
      t.references :feedback
      t.references :user
    end

    add_index :corgi_responses, :feedback_id
    add_index :corgi_responses, :user_id
    add_index :corgi_feedbacks, :user_id
  end

  def down
    drop_table :corgi_feedbacks
    drop_table :corgi_responses
  end 
end
