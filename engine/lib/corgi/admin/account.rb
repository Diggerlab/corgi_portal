ActiveAdmin.register Corgi::Account do
  menu parent: 'User'
  permit_params :user_id, :vcs, :coins, :id 

  filter :id
  filter :vcs
  filter :coins
  filter :created_at
  filter :updated_at
  
  index do
    selectable_column
    column :id
    column :vcs
    column :coins
    column :user do |u|
      u.user.email
    end
    column :expired_at
    
    default_actions 
  end
  
end
