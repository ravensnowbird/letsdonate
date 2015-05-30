json.array!(@food_donors) do |food_donor|
  json.extract! food_donor, :id, :has_transport, :available_till, :sufficient_for
  json.url food_donor_url(food_donor, format: :json)
end
