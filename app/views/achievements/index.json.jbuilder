json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :name, :description, :education_id
  json.url achievement_url(achievement, format: :json)
end
