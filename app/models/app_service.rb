class AppService < ActiveRecord::Base
  belongs_to :service
  belongs_to :app


  def self.auth_service(app, service_ids)
    AppService.where(state: 'user').delete_all
    service_ids.each do |ser_id|
      @service = Service.find(ser_id)
      AppService.create(app_id: app.id, service_id: ser_id, state: @service.state )
    end
  end

  def self.find_services(app)
    findservices = []
    app.app_services.where(state: 'user').each do |app_ser|
      findservices << app_ser.service
    end
    findservices
  end
end
