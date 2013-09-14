Before do |scenario|
  #Agregar aqui la generacion de los escenarios
  
  #Escenario de prueba para el feature Agregar materia al plan de estudios individual
  if scenario.title=='Agregar materia invalida'||scenario.title=='Agregar materia valida'||scenario.title=='Agregar materia repetida'
	  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
	  Estudiante.create(:nombre => 'Estudiante prueba', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	  Curso.create(:nombre => 'Curso prueba', :creditos => 4)
  end
  #Escenario de prueba para el feature Organizar materias por demanda  
  if scenario.title=='Mostrar demanda de materia'
	  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
	  estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	  estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	  estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)

	  curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	  curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	  curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)


		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)

		#2 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)

		#1 de los estudiantes quieren ver el curso 3
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
	end
  
end
