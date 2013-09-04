json.array!(@programas) do |programa|
  json.extract! programa, :nombre, :es_maestria, :duracion
  json.url programa_url(programa, format: :json)
end
