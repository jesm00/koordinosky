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
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante3.id)

		#2 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)

		#1 de los estudiantes quieren ver el curso 3
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de alta prioridad
  if scenario.title=='Asignar cupos estudiantes prioridad alta'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)

	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

		#Todos los estudiantes quieren ver el curso 1

		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id)
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de misma maestria
  if scenario.title=='Asignar cupos estudiantes misma maestria'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id)
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id)
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de otra maestria
  if scenario.title=='Asignar cupos estudiantes otra maestria'
  	  	programaMismaMaestria=Programa.create(:nombre => 'Programa misma maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programaMismaMaestria.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programaMismaMaestria.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id)
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de pregrado
  if scenario.title=='Asignar cupos estudiantes de pregrado'
  		programaMaestria=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => false, :duracion => 5)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programaMaestria.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programaMaestria.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id)
  end
  #Escenario de prueba para el feature Asignación de cupos 
  if scenario.title=='Asignar cupos diversos estudiantes'
  	  	programaPregrado=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => false, :duracion => 4)
  	  	programaOtraMaestria=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 10, :programa_id => programaPregrado.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programaOtraMaestria.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaOtraMaestria.id)
	    estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programaOtraMaestria.id)
		estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaPregrado.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programaPregrado.id)
	    estudiante13=Estudiante.create(:nombre => 'Estudiante prueba 13', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaPregrado.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)

		#Queda sin asignar un estudiante de otra maestria y dos de pregrado
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante13.id)
  end
  #Escenario de prueba para el feature Asignación de cupos 
  if scenario.title=='Reasignar cupos'
  	  	programaPregrado=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => false, :duracion => 10)
  	  	programaOtraMaestria=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id)
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'a@a.a', :semestre_actual => 10, :programa_id => programaPregrado.id)
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id)
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programa.id)
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programaOtraMaestria.id)
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaOtraMaestria.id)
	    estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programaOtraMaestria.id)
		estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaPregrado.id)
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programaPregrado.id)
	    estudiante13=Estudiante.create(:nombre => 'Estudiante prueba 13', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaPregrado.id)
	    estudiante14=Estudiante.create(:nombre => 'Estudiante prueba 14', :email => 'a@a.a', :semestre_actual => 2, :programa_id => programaPregrado.id)

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)

		#Se asignan todos los cupos y no asignados 2 de otra maestria y 2 de pregrado
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante13.id)
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante14.id)
  end

  #Escenario de prueba para el feature Reasignar cupos sobrantes
end
