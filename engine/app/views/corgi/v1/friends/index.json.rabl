object false

child(@friends) do 
  attribute :id
  node(:email) {|m| m.friend_user.email}
end
