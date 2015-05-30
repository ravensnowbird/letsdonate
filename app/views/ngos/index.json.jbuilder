json.array!(@ngos) do |ngo|
  json.extract! ngo, :id, :name, :address, :lat, :lang
  json.url ngo_url(ngo, format: :json)
end
