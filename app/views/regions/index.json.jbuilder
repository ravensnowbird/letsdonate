json.array!(@regions) do |region|
  json.extract! region, :id, :address, :lat, :long, :region_for, :region_for_id
  json.url region_url(region, format: :json)
end
