json.array!(@skilltypes) do |skilltype|
  json.extract! skilltype, :id, :name, :user_id
  json.url skilltype_url(skilltype, format: :json)
end
