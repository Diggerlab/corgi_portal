ActiveAdmin.register Corgi::Notice::Translation do
  menu parent: 'Games'
  permit_params :notice_id, :id, :locale, :title, :content 
  filter :notice_id
  filter :id
  filter :title
  filter :content

  index  do 
    column :id  
    column :notice_id                    
    column :locale
    column :title
    column :content
    column :created_at              
    default_actions    
  end         

  form do |f|
    f.inputs "公告" do
      f.input :notice_id
    end
    f.inputs "语言环境" do
      f.input :locale
    end
    f.inputs "标题" do
      f.input :title
    end
    f.inputs "内容" do
      f.kindeditor :content, :owner_id => current_admin_user.id, filterMode: false
    end
    f.actions
  end
end