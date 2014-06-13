object false
child(@version) do
  attributes :id, :base_build, :latest_build, :publisher, :latest_version, :latest_description, :latest_url, :published_at
  node(:force_update){ @force_update } 
end
