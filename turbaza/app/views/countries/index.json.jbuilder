json.array!(@countries) do |country|
  json.extract! country, :id, :name, :phone_code
  json.url country_url(country, format: :json)
end
