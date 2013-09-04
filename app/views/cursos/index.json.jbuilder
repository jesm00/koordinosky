json.array!(@cursos) do |curso|
  json.extract! curso, :nombre, :creditos
  json.url curso_url(curso, format: :json)
end
