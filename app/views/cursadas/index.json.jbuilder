json.array!(@cursadas) do |cursada|
  json.extract! cursada, 
  json.url cursada_url(cursada, format: :json)
end
