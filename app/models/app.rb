class App < ActiveRecord::Base
  belongs_to :user
  has_many :app_sevices
end
