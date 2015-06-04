json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :email, :password, :location, :bio
  json.url user_url(user, format: :json)
end
