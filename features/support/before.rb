Before do |scenario|

  #Agregar aqui la generacion de los escenarios
  
  #Escenario de prueba para el feature Agregar materia al plan de estudios individual
  if scenario.title=='Agregar materia invalida'||scenario.title=='Agregar materia valida'||scenario.title=='Agregar materia repetida'
	  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
	  Estudiante.create(:nombre => 'Estudiante prueba', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	  Curso.create(:nombre => 'Curso prueba', :creditos => 4)
  end
  #Escenario de prueba para el feature Organizar materias por demanda  
  if scenario.title=='Mostrar demanda de materia'
	  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
	  estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	  estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	  estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	  curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	  curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	  curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)


		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso3.id,:estudiante_id => estudiante3.id, :semestre => "201410")

		#2 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")

		#1 de los estudiantes quieren ver el curso 3
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de alta prioridad
  if scenario.title=='Asignar cupos estudiantes prioridad alta'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)

	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

		#Todos los estudiantes quieren ver el curso 1

		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de misma maestria
  if scenario.title=='Asignar cupos estudiantes misma maestria'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de otra maestria
  if scenario.title=='Asignar cupos estudiantes otra maestria'
  	  	programaMismaMaestria=Programa.create(:nombre => 'Programa misma maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programaMismaMaestria.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programaMismaMaestria.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos estudiantes de pregrado
  if scenario.title=='Asignar cupos estudiantes de pregrado'
  		programaMaestria=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => false, :duracion => 5)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programaMaestria.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programaMaestria.id)

		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#6 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos 
  if scenario.title=='Asignar cupos diversos estudiantes'
  	  	programaPregrado=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => false, :duracion => 4)
  	  	programaOtraMaestria=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 10, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 3, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 2, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
	    estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 1, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
		estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 2, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 3, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante13=Estudiante.create(:nombre => 'Estudiante prueba 13', :email => 'm@m.m', :semestre_actual => 2, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)

		#Queda sin asignar un estudiante de otra maestria y dos de pregrado
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante13.id, :semestre => "201410")
  end
  #Escenario de prueba para el feature Asignación de cupos 
  if scenario.title=='Reasignar cupos'
  	  	programaPregrado=Programa.create(:nombre => 'Programa pregrado prueba',:es_maestria => false, :duracion => 10)
  	  	programaOtraMaestria=Programa.create(:nombre => 'Programa otra maestria prueba',:es_maestria => true, :duracion => 4)
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 4, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 10, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 3, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 2, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
	    estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 1, :programa_id => programaOtraMaestria.id, :password => '123456', :password_confirmation => '123456')
		estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 2, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 3, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante13=Estudiante.create(:nombre => 'Estudiante prueba 13', :email => 'm@m.m', :semestre_actual => 2, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')
	    estudiante14=Estudiante.create(:nombre => 'Estudiante prueba 14', :email => 'n@n.n', :semestre_actual => 2, :programa_id => programaPregrado.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)

		#Se asignan todos los cupos y no asignados 2 de otra maestria y 2 de pregrado
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante13.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante14.id, :semestre => "201410")
  end

  #Escenario de prueba para el feature Determinar conflictos de horario
  if scenario.title=='Ir a asignacion' ||scenario.title=='Volver a sugerencia' ||scenario.title=='Sugerir Oferta' ||  scenario.title=='Sugerir Oferta' || scenario.title=='Agregar Cupo' || scenario.title=='Eliminar Cupo' || scenario.title=='Determinar Conflictos Criticos' || scenario.title=='Determinar Conflictos Leves'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	    curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)
	    valido3=Valida.create(:curso_id => curso3.id, :programa_id => programa.id)

		#12 de los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#12 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante12.id, :semestre => "201410")
  end
   #Escenario de prueba para el feature Determinar conflictos de horario
  if scenario.title=='Agregar Curso Oferta'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	    curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)
	    valido3=Valida.create(:curso_id => curso3.id, :programa_id => programa.id)
  end
   #Escenario de prueba para el feature Determinar conflictos de horario
  if scenario.title=='Sugerir Pensum 4 semestres'||scenario.title=='Sugerir Pensum 3 semestres'||scenario.title=='Sugerir Pensum 2 semestres'||scenario.title=='Sugerir Pensum 1 semestre'
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)

  	  	curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	    curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)
	    curso4=Curso.create(:nombre => 'Curso prueba 4', :creditos => 4)

	    pensum1=Pensum.create(:curso_id => curso1.id, :programa_id =>programa.id, :semestre=>1)
	    pensum2=Pensum.create(:curso_id => curso2.id, :programa_id =>programa.id, :semestre=>2)
	    pensum3=Pensum.create(:curso_id => curso3.id, :programa_id =>programa.id, :semestre=>3)
	    pensum4=Pensum.create(:curso_id => curso4.id, :programa_id =>programa.id, :semestre=>4)
	   

  end

  #Escenario de prueba para el feature Organizar materias por demanda  
  if scenario.title=='Eliminar materia plan'
	  programa=Programa.create(:nombre => 'Programa prueba',:es_maestria => true, :duracion => 4)
	  estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	  curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)


		#Todos los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
  end

  #Escenario de prueba para el feature Determinar conflictos de horario
  if scenario.title=='Guardar Oferta'||scenario.title=='Ver Oferta Guardada'||scenario.title=='Sin conflictos'||scenario.title=='Solo conflictos criticos' ||scenario.title=='Solo conflictos leves' ||scenario.title=='Conflictos leves y criticos' 
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	    curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)
	    valido3=Valida.create(:curso_id => curso3.id, :programa_id => programa.id)

		#12 de los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#12 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante12.id, :semestre => "201410")
  end

    if scenario.title=='Sin llenar' || scenario.title=='Llenar global' 
  	  	programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante3=Estudiante.create(:nombre => 'Estudiante prueba 3', :email => 'c@c.c', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante4=Estudiante.create(:nombre => 'Estudiante prueba 4', :email => 'd@d.d', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante5=Estudiante.create(:nombre => 'Estudiante prueba 5', :email => 'e@e.e', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante6=Estudiante.create(:nombre => 'Estudiante prueba 6', :email => 'f@f.f', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante7=Estudiante.create(:nombre => 'Estudiante prueba 7', :email => 'g@g.g', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante8=Estudiante.create(:nombre => 'Estudiante prueba 8', :email => 'h@h.h', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante9=Estudiante.create(:nombre => 'Estudiante prueba 9', :email => 'i@i.i', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
		estudiante10=Estudiante.create(:nombre => 'Estudiante prueba 10', :email => 'j@j.j', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante11=Estudiante.create(:nombre => 'Estudiante prueba 11', :email => 'k@k.k', :semestre_actual => 3, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante12=Estudiante.create(:nombre => 'Estudiante prueba 12', :email => 'l@l.l', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')

	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)
	    curso3=Curso.create(:nombre => 'Curso prueba 3', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)
	    valido3=Valida.create(:curso_id => curso3.id, :programa_id => programa.id)

		#12 de los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante12.id, :semestre => "201410")

		#12 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante3.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante4.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante5.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante6.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante7.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante8.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante9.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante10.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante11.id, :semestre => "201410")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante12.id, :semestre => "201410")
    	Capybara.current_driver = :selenium
  end
  if scenario.title=='Optimizar sugerencia'
  		programa=Programa.create(:nombre => 'Programa maestria prueba',:es_maestria => true, :duracion => 4)
	    estudiante1=Estudiante.create(:nombre => 'Estudiante prueba 1', :email => 'a@a.a', :semestre_actual => 1, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    estudiante2=Estudiante.create(:nombre => 'Estudiante prueba 2', :email => 'b@b.b', :semestre_actual => 2, :programa_id => programa.id, :password => '123456', :password_confirmation => '123456')
	    
	    curso1=Curso.create(:nombre => 'Curso prueba 1', :creditos => 4)
	    curso2=Curso.create(:nombre => 'Curso prueba 2', :creditos => 4)

	    valido1=Valida.create(:curso_id => curso1.id, :programa_id => programa.id)
	    valido2=Valida.create(:curso_id => curso2.id, :programa_id => programa.id)

		#1 de los estudiantes quieren ver el curso 1
		Plan.create(:curso_id=>curso1.id,:estudiante_id => estudiante1.id, :semestre => "201410")

		#2 de los estudiantes quieren ver el curso 2
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante1.id, :semestre => "201420")
		Plan.create(:curso_id=>curso2.id,:estudiante_id => estudiante2.id, :semestre => "201410")
  end
end
