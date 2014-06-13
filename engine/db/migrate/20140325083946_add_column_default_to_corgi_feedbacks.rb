class AddColumnDefaultToCorgiFeedbacks < ActiveRecord::Migration
  def change
    change_column :corgi_feedbacks, :responses_count, :integer, :default => 0
  end
end
