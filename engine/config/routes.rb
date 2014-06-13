require 'resque/server'
Corgi::Engine.routes.draw do
  namespace :v1 do
    resources :users

    resources :recharges 

    resources :sessions do 
      collection do
        post :sina_callback
        post :qq_callback 
      end
    end

    resources :feedbacks do
      resources :responses
    end

    resources :password_requests, only: [:new, :create]
    resources :build_versions, only: :index
    resources :notices, only: :index

    post '/login', to: 'logins#create'
    get '/login', to: 'logins#login' 
    
    get '/users/:token/change_password', to: 'users#change_password' #send_email get
    post '/users/:token/change_password', to: 'users#update_password'
    
    get '/password_requests/new_password', to: 'password_requests#new_password'
    post '/password_requests/new_password', to: 'password_requests#change_password'

    resources :friends do 
      post :import, on: :collection
    end
  end
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
end
