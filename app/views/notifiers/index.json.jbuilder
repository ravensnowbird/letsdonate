json.array!(@notifiers) do |notifier|
  json.extract! notifier, :id, :name, :phone, :email, :ngo_id
  json.url notifier_url(notifier, format: :json)
end
