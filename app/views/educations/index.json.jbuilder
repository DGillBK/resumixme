json.array!(@educations) do |education|
  json.extract! education, :id, :name, :startDate, :endDate, :gpa, :user_id
  json.url education_url(education, format: :json)
end
