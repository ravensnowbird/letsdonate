json.array!(@food_responces) do |food_responce|
  json.extract! food_responce, :id, :ngo_id, :food_donor_id, :status, :has_transport
  json.url food_responce_url(food_responce, format: :json)
end
