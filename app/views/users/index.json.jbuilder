json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :email, :password_digest, :phone, :url, :linkedin
  json.url user_url(user, format: :json)
end
