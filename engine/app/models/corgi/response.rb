module Corgi
  class Response < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    # has_paper_trail
    belongs_to :user
    belongs_to :feedback, counter_cache: true
      validates_presence_of :content 
      
  end

end
