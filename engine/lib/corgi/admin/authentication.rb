ActiveAdmin.register Corgi::Authentication do
  menu parent: 'User'
  permit_params :id, :provider, :user_id, :token, :token_secret, :openid, :openkey, :refresh_token, :expired_at

  filter :prvider
  filter :id
  filter :token
  filter :token_secret
  filter :expired_at
  filter :created_at
  filter :updated_at
  
  index do
    selectable_column
    column :id
    column :provider
    column :user do |u|
      u.user.email
    end
    column :expired_at
    
    default_actions 
  end
  
end
