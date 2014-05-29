class Service < ActiveRecord::Base
  has_many :app_services
  has_many :service_functions
end
