json.array!(@transporters) do |transporter|
  json.extract! transporter, :id, :name, :phone, :email
  json.url transporter_url(transporter, format: :json)
end
