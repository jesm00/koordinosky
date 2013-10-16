json.array!(@validas) do |valida|
  json.extract! valida, 
  json.url valida_url(valida, format: :json)
end
