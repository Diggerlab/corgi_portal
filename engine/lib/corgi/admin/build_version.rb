ActiveAdmin.register Corgi::BuildVersion do
  menu parent: 'Versions'
  permit_params :id, :base_build, :latest_build, :publisher, :latest_version, 
  :latest_description, :latest_url, :published_at
  

end