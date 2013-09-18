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
		@nCuposTotales=12
		@nCuposAsignados=0
		@asignados= Hash.new
		@ofertaCurso=Oferta.new(curso,@nCuposTotales)
		
		#Hacer calculos necesarios
		calcularDemanda()
		asignarEstudiantesAltaPrioridad()
		separarEstudiantes()
		asignarCuposMismaMaestria()
		asignarCuposOtraMaestria()
		asignarCuposPregrado()
		reasignarCuposSobrantes()
		#Hacer render a la pagina resultado
		render "optimizador/asignacion"
	end
	
	def calcularDemanda
		#@asignados[id_estudiante]=true
		#if @asignados[id_estudiante].nil?
		#Buscar los planes de estudio de los estudiantes donde aparece esta materia
		@demanda=Plan.where(curso_id: @ofertaCurso.materia.id)
		#Contar la demanda de los estudiantes
		@demandaCurso=@demanda.count
		#Separar a los estudiantes entre los de maestría (o maestrias de la materia en caso de que sea valida
		#para mas de una, los de tras maestrias y los de pregrado 
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
	
	def asignarEstudiantesAltaPrioridad
		@estAltaPrioridad=Array.new
		@demanda.each do |plan|
			if plan.estudiante.semestre_actual == plan.estudiante.programa.duracion
				@estAltaPrioridad.push(plan.estudiante)
			end
		end
		@asignadosAltaPrioridad=Array.new
		@noAsignadosAltaPrioridad=Array.new
		@estAltaPrioridad.each do |est|
			nCuposRestantes=@nCuposTotales-@nCuposAsignados
			if nCuposRestantes > 0
				@asignadosAltaPrioridad.push(est)
				@asignados[est.id]=true
				@nCuposAsignados=@nCuposAsignados+1
			else
				@noAsignadosAltaPrioridad.push(est)
			end
		end
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

	def asignarCuposMismaMaestria
		cuposdisponibles=((@nCuposTotales-@nCuposAsignados)*0.5).ceil
	    @asignadosMismaMaestria=Array.new
	    @noAsignadosMismaMaestria=Array.new
	    @estMaestria.each do |est|
	    	if not(@asignados[est.id])
	    		if cuposdisponibles>0
	    			@asignadosMismaMaestria.push(est)
	    			@asignados[est.id]=true
	    			cuposdisponibles=cuposdisponibles-1
	    			@nCuposAsignados=@nCuposAsignados+1
		    	else
		    		@noAsignadosMismaMaestria.push(est)
	    		end
	    	end
		end
	end

	def asignarCuposOtraMaestria
		cuposdisponibles=((@nCuposTotales-@nCuposAsignados)*0.3).ceil
	    @asignadosOtraMaestria=Array.new
	    @noAsignadosOtraMaestria=Array.new
	    @estOtraMaestria.each do |est|
	    	if not(@asignados[est.id])
	    		if cuposdisponibles>0
	    			@asignadosOtraMaestria.push(est)
	    			@asignados[est.id]=true
	    			cuposdisponibles=cuposdisponibles-1
	    			@nCuposAsignados=@nCuposAsignados+1
		    	else
		    		@noAsignadosOtraMaestria.push(est)
	    		end
	    	end
		end
	end

	def asignarCuposPregrado
		cuposdisponibles=((@nCuposTotales-@nCuposAsignados)*0.2).ceil
	    @asignadosPregrado=Array.new
	    @noAsignadosPregrado=Array.new
	    @estPregrado.each do |est|
	    	if not(@asignados[est.id])
	    		if cuposdisponibles>0
	    			@asignadosPregrado.push(est)
	    			@asignados[est.id]=true
	    			cuposdisponibles=cuposdisponibles-1
	    			@nCuposAsignados=@nCuposAsignados+1
		    	else
		    		@noAsignadosPregrado.push(est)
	    		end
	    	end
		end
	end

	def reasignarCuposSobrantes
		cuposdisponibles=@nCuposTotales-@nCuposAsignados
		asignadosMaestria=Array.new
		asignadosOtra=Array.new
		asignadosPre=Array.new
		if cuposdisponibles>0
		    @noAsignadosMismaMaestria.each do |est|
		    	if not(@asignados[est.id])
		    		if cuposdisponibles>0
		    			@asignadosMismaMaestria.push(est)
		    			asignadosMaestria.push(est)
		    			@asignados[est.id]=true
		    			cuposdisponibles=cuposdisponibles-1
		    			@nCuposAsignados=@nCuposAsignados+1
		    		end
		    	end
		    end
		    asignadosMaestria.each do |est|
				@noAsignadosMismaMaestria.delete(est)
		    end
	    	if cuposdisponibles>0
	    		@noAsignadosOtraMaestria.each do |est|
		    		if not(@asignados[est.id])
			    		if cuposdisponibles>0
			    			@asignadosOtraMaestria.push(est)
		    				asignadosOtra.push(est)
			    			@asignados[est.id]=true
			    			cuposdisponibles=cuposdisponibles-1
			    			@nCuposAsignados=@nCuposAsignados+1
			    		end
			    	end
			    end

		    asignadosOtra.each do |est|
			    @noAsignadosOtraMaestria.delete(est)
		    end
		    	if cuposdisponibles>0
		    		@noAsignadosPregrado.each do |est|
				    	if not(@asignados[est.id])
				    		if cuposdisponibles>0
				    			@asignadosPregrado.push(est)
		    					asignadosPre.push(est)
				    			@asignados[est.id]=true
				    			cuposdisponibles=cuposdisponibles-1
				    			@nCuposAsignados=@nCuposAsignados+1
				    		end
				    	end
				    end
			asignadosPre.each do |est|
				@noAsignadosPregrado.delete(est)
		    end
			    end
		    end
		end
	end
end
