ActiveAdmin.register Corgi::PasswordRequest do
  menu parent: 'User'
  permit_params :id, :user_id, :email, :ip, :token, :state

  filter :email
  filter :id
  filter :expired_at
  filter :created_at
  filter :updated_at
  
  index do
    selectable_column
    column :id
    column :email
    column :created_at
    
    default_actions 
  end
  
end
