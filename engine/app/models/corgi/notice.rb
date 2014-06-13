module Corgi
  class Notice < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    # has_paper_trail
    translates :title, :content
    belongs_to :admin_user
    scope :live, -> {where(enabled: true)}
    after_initialize :init_values



    private
    def init_values
     self.start_at = Time.now
     self.end_at = Time.now + 30.days  
    end
  end

end

