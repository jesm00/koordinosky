json.array!(@pensums) do |pensum|
  json.extract! pensum, 
  json.url pensum_url(pensum, format: :json)
end
