json.extract! vehicle, :id, :kind, :line, :description, :price, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
