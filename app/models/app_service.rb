class AppService < ActiveRecord::Base
  belongs_to :service
  belongs_to :app

  def self.auth_service(app)
    exist = []
    app.app_services.each do |ser|
      exist << ser.service
    end
    services = Service.all - exist
  end
end
