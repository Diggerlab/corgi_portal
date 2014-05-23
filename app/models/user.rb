require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :name, :password, :re_password, :company, :contact_email
  validates :contact_email, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :password, length: { minimum: 6}

  before_create :init_password

  private

  def init_password
    raise "两次密码输入不一致" unless self.password == self.re_password
    self.password = BCrypt::Password.create(self.password)
    self.re_password = BCrypt::Password.create(self.re_password)

  end
end
