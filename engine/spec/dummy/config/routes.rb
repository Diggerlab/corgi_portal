Rails.application.routes.draw do
  mount Corgi::Engine => "/api"
end
