ActiveAdmin.register Corgi::UserCode do
  menu parent: 'User'
  permit_params :user_id, :code, :id 

  filter :id
  filter :user_id
  filter :code
 
  index do
    selectable_column
    column :id
    column :user do |u|
      u.user.email
    end
    column :code
    
    default_actions 
  end
  
end
