ActiveAdmin.register Corgi::User do
 menu parent: 'User'

  permit_params :id, :email, :password, :state, :authentication_token, :role, :authentication_token_updated_at
  filter :email
  filter :authentication_token
  filter :authentication_token_updated_at
  filter :state
  filter :role
  filter :created_at
  index do       
    column :id
    column :authentication_token                     
    column :state
    column :role                     
    column :created_at
    column :updated_at
    column :authentication_token_updated_at             
    default_actions                   
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :state
      row :authentication_token
      row :created_at
      row :updated_at
      row :authentication_token_updated_at
      
      row :account
      row :user_code
      row :vc do |u|
        u.account.vcs
      end
      row :coin do |u|
        u.account.coins
      end
    end
  end
  
end
