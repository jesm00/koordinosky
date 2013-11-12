json.array!(@oferta) do |ofertum|
  json.extract! ofertum, :cupos
  json.url ofertum_url(ofertum, format: :json)
end
