ActiveAdmin.register Corgi::Response do
  menu parent: 'Games'
  permit_params :id, :feedback_id, :user_id, :content, :contact, :ip
  filter :content
  filter :contact
  filter :ip
  filter :feedback_id
  filter :user_id
  filter :created_at

  index do
    selectable_column
    column :id
    column :content
    column :contact
    column :ip
    column :feedback_id
    column :user do |n|
      n.user.email
    end
    column :created_at
    
    default_actions 
  end
 
end
