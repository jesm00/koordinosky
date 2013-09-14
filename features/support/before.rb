Before do
  #Agregar aqui la generacion de los escenarios
  
  #Escenario de prueba para el feature Agregar materia al plan de estudios individual
  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
  Estudiante.create(:nombre => 'Estudiante prueba', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
  Curso.create!(:nombre => 'Curso prueba', :creditos => 4)

end
