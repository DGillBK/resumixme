json.array!(@languages) do |language|
  json.extract! language, :id, :language, :fluency, :user_id
  json.url language_url(language, format: :json)
end
