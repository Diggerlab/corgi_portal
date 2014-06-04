require 'bcrypt'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # include BCrypt
  # validates_presence_of :name, :password, :re_password
  # validates :password, length: { minimum: 6}
  has_many :apps
  has_one :profile

  after_create :create_profile

  private
  def create_profile
    profile = Profile.new(user: self)
    profile.init_default
  end
end
