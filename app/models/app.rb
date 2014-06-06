class App < ActiveRecord::Base
  belongs_to :user
  has_many :app_services

  after_create :create_sys_services

  def create_sys_services
    self.state = true
    @services = Service.where(state: 'system')
    @services.each do |ser|
      AppService.create(app_id: self.id, service_id: ser.id, state: ser.state)
    end
    self.save!
  end
end
