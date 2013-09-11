class OptimizadorController < ApplicationController

	def asignacionCupos	
		#TODO Recibir por parametro los cupos que se ofrecen
		#cupos=params[:cupos].to_i
		idCurso=params[:curso_id].to_i
		#Si el id de curso no es valido
		if idCurso!=0
			curso=Curso.find(idCurso)
		end
		#Si el id era invalido y aun no se a cargado un curso cargar el primero de la base de datos
		if curso.nil?
			curso=Curso.first()
		end
		cupos=50
		@ofertaCurso=Oferta.new(curso,cupos)
		
		#Hacer calculos necesarios
		calcularDemanda()
		
		#Hacer render a la pagina resultado
		render "optimizador/asignacion"
	end
	
	def calcularDemanda
		#Buscar los planes de estudio de los estudiantes donde aparece esta materia
		@demanda=Plan.where(curso_id: @ofertaCurso.materia.id)
		#Contar la demanda de los estudiantes
		@demandaCurso=@demanda.count
		#Separar a los estudiantes entre los de maestría (o maestrias de la materia en caso de que sea valida
		#para mas de una, los de tras maestrias y los de pregrado 
		separarEstudiantes()
	end
	
	def calcularDemandaTodos
		@res=Plan.find(:all, 
		  :select => '"cursos".id as id_curso, "cursos".nombre, count(estudiante_id) as demanda', 
		  :joins => :curso, 
		  :group => '"cursos".id', 
		  :order => 'demanda DESC'
		)
		
		render "optimizador/demanda"
	end
	
	def separarEstudiantes
		@estMaestria=Array.new
		@estPregrado=Array.new
		@estOtraMaestria=Array.new
		#Para cada plan
		@demanda.each do |plan|
			#Revisar si el estudiante es de pregrado
			if not(plan.estudiante.programa.es_maestria)
				@estPregrado.push(plan.estudiante)
			else
				#Si es de maestria verificar si la maestria es valida para este curso
				#y agregar al estudiante a la lista correspondiente
				if @ofertaCurso.materia.esValida(plan.estudiante.programa.id)
					@estMaestria.push(plan.estudiante)
				else
					@estOtraMaestria.push(plan.estudiante)
				end
			end
			
		end
	end
end
