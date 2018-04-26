json.extract! user, :id, :name, :birthdate, :fingerprint, :created_at, :updated_at
json.url user_url(user, format: :json)
