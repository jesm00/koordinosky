json.array!(@estudiantes) do |estudiante|
  json.extract! estudiante, :nombre, :email, :semestre_actual
  json.url estudiante_url(estudiante, format: :json)
end
