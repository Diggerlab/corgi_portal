class Profile < ActiveRecord::Base
  belongs_to :user

  def init_default
    self.company = ''
    self.realname = ''
    self.save
  end
end
