ActiveAdmin.register Corgi::Notice do

  menu parent: 'Games'
  permit_params :admin_user_id, :id, :enabled, :start_up, :end_up, :content, :title
  filter :admin_user_id
  filter :enabled
  filter :start_at
  filter :end_at
  index  do  
    column "開始時間",:start_at                  
    column "結束時間",:end_at     
    column "活動是否存在",:enabled                 
    default_actions    
  end         
           
  form do |f|
    f.inputs "标题" do
      f.input :title
    end
    f.inputs "活動是否結束" do
      f.input :enabled
    end
    f.inputs "開始時間" do
      f.input :start_at
    end
    f.inputs "結束時間" do
      f.input :end_at, value: (Time.now + 3600)
    end
    f.inputs "content" do
      f.kindeditor :content, :owner_id => current_admin_user.id, filterMode: false
    end
    f.input :admin_user_id, as: 'hidden', value: current_admin_user.id
    f.actions
  end
end
