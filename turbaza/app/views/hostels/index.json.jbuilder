json.array!(@hostels) do |hostel|
  json.extract! hostel, :id, :name, :email, :address, :city_id, :phone, :description, :photo_string
  json.url hostel_url(hostel, format: :json)
end
