json.array!(@employments) do |employment|
  json.extract! employment, :id, :name, :startDate, :endDate, :address, :phone, :user_id
  json.url employment_url(employment, format: :json)
end
