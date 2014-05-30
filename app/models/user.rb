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
  has_one :user_profile

  # before_create :init_password
  # before_action :change_password, only: :update

  # def self.authentication_user!(name,password)
  #   @user = User.find_by name: name
  #   raise 'user name is wrong' unless @user
  #   hashed_pass = Password.new(@user.password)
  #   if hashed_pass == password
  #     return @user
  #   else
  #     raise 'password is wrong'
  #   end
  # end

  # def remember_me
  #   true
  # end

  # private

  # def init_password
  #   raise "两次密码输入不一致" unless self.password == self.re_password
  #   self.password = BCrypt::Password.create(self.password)
  #   self.re_password = BCrypt::Password.create(self.re_password)
  # end

end
