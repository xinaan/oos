json.array!(@users) do |user|
  json.extract! user, :username, :hashed_password, :salt, :email
  json.url user_url(user, format: :json)
end
