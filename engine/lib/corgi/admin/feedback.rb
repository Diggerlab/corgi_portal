ActiveAdmin.register Corgi::Feedback do
  menu parent: 'Games'
  permit_params :id, :content, :contact, :ip, :user_id

  filter :content
  filter :id
  filter :contact
  filter :ip
  filter :created_at

  show do |feedback|
    attributes_table do
      row :id
      row :content
      row :contact
      row :ip
      row :user_id
      row :responses_count
      row :created_at
      render partial: 'corgi/admin/feedback', locals: {:feedback => feedback}
    end
  end

  index do
    selectable_column
    column :id
    column :content
    column :contact
    column :user do |n|
      n.user.email
    end
    column :created_at
    column :responses_count
    actions defaults: true do |feedback|
      link_to 'reply', new_admin_corgi_response_path(:corgi_response => { :user_id => current_admin_user.user_id, :feedback_id => feedback.id })
    end  
  end
  

end
