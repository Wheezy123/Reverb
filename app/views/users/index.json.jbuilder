json.array!(@users) do |user|
  json.extract! user, :last_name, :first_name, :gender, :date_of_birth, :favorite_color
  json.url user_url(user, format: :json)
end
