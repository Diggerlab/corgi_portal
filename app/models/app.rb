class App < ActiveRecord::Base
  belongs_to :user
  has_many :user_sevices
end
