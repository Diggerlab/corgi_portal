object false

child(@friends) do
  attribute :id, :user_id, :friend_user_id
  node(:email) do |friend|
    friend.friend_user.email
  end
end