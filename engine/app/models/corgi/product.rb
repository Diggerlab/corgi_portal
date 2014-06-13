module Corgi
  class Product < ActiveRecord::Base
    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

    # has_paper_trail
    validates_presence_of :sk_product_id
    
    alias_attribute :name, :sk_product_id

    
  end

end
