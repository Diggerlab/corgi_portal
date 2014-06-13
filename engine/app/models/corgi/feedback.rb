module Corgi
  class Feedback < ActiveRecord::Base
    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

    # has_paper_trail
    belongs_to :user
    has_many :responses
    validates_presence_of :content, :contact

  end

end
