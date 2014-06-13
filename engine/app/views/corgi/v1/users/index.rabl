object false

child(@users => "user") do 
  attribute :id, :email, :password, :authentication_token, :authentication_token_updated_at, :role, :state, :created_at
end
