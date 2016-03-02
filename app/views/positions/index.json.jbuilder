json.array!(@positions) do |position|
  json.extract! position, :id, :title, :startDate, :endDate, :employment_id
  json.url position_url(position, format: :json)
end
