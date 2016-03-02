json.array!(@degrees) do |degree|
  json.extract! degree, :id, :level, :completed, :education_id
  json.url degree_url(degree, format: :json)
end
