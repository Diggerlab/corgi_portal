ActiveAdmin.register Corgi::Product do
  menu parent: 'Games'  
  permit_params :id, :sk_product_id, :vcs_got, :enabled, :short_name, :gross
  form do |f|
    f.inputs "Details" do
      f.input :sk_product_id, :hint => "Product identifier for Store Kit Payment"
      f.input :vcs_got
      f.input :enabled
      f.input :short_name
      f.input :gross
    end
    f.actions
  end

  index do
    selectable_column
  
    column :id
    column :sk_product_id
    column :vcs_got
    column :enabled
    column :short_name
    column :gross
    
    default_actions 
  end
  
end