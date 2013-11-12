json.array!(@escenarios) do |escenario|
  json.extract! escenario, :nombre
  json.url escenario_url(escenario, format: :json)
end
