ActiveAdmin.register Corgi::Friend do
  menu parent: 'User'
  permit_params :user_id, :friend_user_id, :provider, :id 

  filter :id
  filter :user_id
  filter :friend_user_id
  filter :provider
  filter :created_at
 
  index do
    selectable_column
    column :id
    column :friend do |u|
      u.friend_user.email
    end
    column :provider
    column :created_at
    
    default_actions 
  end
  
end
