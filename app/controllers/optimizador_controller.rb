class OptimizadorController < ApplicationController

	def estadisticas
		ultimaOferta(false)
		render "optimizador/estadisticas"
	end

	def sugerirSemestre
		@cursos = Curso.all
		$maximos=nil
		$minimos=nil
		render "optimizador/sugerirSemestre"
	end	

	def setMinimo
		if $minimos.nil?
			$minimos=Hash.new
		end
		if not(params[:curso_id].nil?||params[:minimo].to_i<=0)
			$minimos[params[:curso_id].to_i]=params[:minimo].to_i
		end
	end

	def setMaximo		
		if $maximos.nil?
			$maximos=Hash.new
		end
		if not(params[:curso_id].nil?||params[:maximo].to_i<=0)
			$maximos[params[:curso_id].to_i]=params[:maximo].to_i
		end
	end

	def sugerirOferta
		$ofertaDeCursos=Hash.new
		Curso.all.each do |curso|
			@ofertaCurso=Oferta.new(curso,30)
			calcularDemanda()
			if @demandaCurso>0
				#Si se definio un máximo usar ese máximo como número de cupos inicial
				#Si no usar un valor arbitrariamente grande porque no hay limite (10000)
				if $maximos.nil?||$maximos[curso.id].nil?
					@ofertaCurso.cupos=10000
				else
					@ofertaCurso.cupos=$maximos[curso.id]
				end
				$ofertaDeCursos[curso.id]=@ofertaCurso
			end
		end

		obtenerSugerenciaOptima()
		render "optimizador/displayOferta"
	end

	def obtenerSugerenciaOptima
		#Calcular asignación inicial
		calcularAsignacionOferta()
		#Se va a eliminar de a un curso que no cumple con los minimos requeridos
		begin	
			#Recalcular conflictos
			recalcularConflictos()	  
			#Intentar asignar conflictos a materias que no esten llenas
			reasignarConflictos()
		end while eliminarNoCumplenMinimos()
		#Recalcular conflictos para estadisticas
		recalcularConflictos()

		contarCuposFinales()
	end

	def eliminarNoCumplenMinimos
		aEliminar=nil
		difMin=0
		#Buscar el curso que esta más lejos de cumplir el mínimo de cupos
		$ofertaDeCursos.each do |id,oferta|
			#Si para este curso hay definido un minimo y la diferencia entre los asignados y el minimo es mayor que la mayor diferencia encontrada hasta ahora
			if not($minimos.nil?||$minimos[id].nil?)&&($minimos[id]-@asignadosCurso[id].count>difMin)
				aEliminar=id
				difMin=$minimos[id]-@asignadosCurso[id].count
			end
		end
		#Si no se encontro ninguno devolver false indicando que se cumplieron los requisitos
		if aEliminar.nil?
			return false
		end
		#Si se encontro una materia eliminar la oferta
		$ofertaDeCursos.delete(aEliminar)
		cursoEliminar=Curso.find(aEliminar)
		#Para cada uno de los estudiantes que tenian asignado este curso
		@asignadosCurso[aEliminar].each do |id,val|
			#Eliminar el curso de la lista de asignadas para el estudiante
			@asignadasEstudiantes[id].delete(cursoEliminar)
			#Indicar que el estudiante tiene una materia menos asignada
			@cuantasEstudiantes[id]-=1
		end

		#Eliminar los asignados a esta materia
		@asignadosCurso.delete(aEliminar)
		return true
	end

	def contarCuposFinales		

		$ofertaDeCursos.each do |id,oferta|
			if $ofertaDeCursos[id].cupos==10000||(not($maximos.nil?||$maximos[id].nil?)&&$ofertaDeCursos[id].cupos==$maximos[id])
				$ofertaDeCursos[id].cupos=@asignadosCurso[id].count
			end
		end

		@ofertaSorted=$ofertaDeCursos.sort_by { |id, oferta| oferta.cupos }.reverse	
	end

	def recalcularConflictos
		@conflictosCrtiticos=Hash.new
		@otrosConflictos=Hash.new
		@sinProblemas=Hash.new
		calcularConlfictos()
	end

	def reasignarConflictos

		#Para cada conflicto critico
		@conflictosCrtiticos.each do |id,val|
			#Contar cuantas faltan por asignar
			porAsignar=@demandaEstudiantes[id].demanda	
			#Se han asignado 0	
			asignadas=0  			
			#Mirar todos los planes del estudiante
	    	Estudiante.find(id).plans.each do |plan|
	    		#Si ya se le asignaron suficientes terminar
	    		if asignadas==porAsignar
	    			break
	    		end
	    		#Si este curso se esta ofreciendo y queda al menos un cupo libre
	    		if not($ofertaDeCursos[plan.curso.id].nil?||$ofertaDeCursos[plan.curso.id].cupos<=@asignadosCurso[plan.curso.id].count)
	    			#Asignar al estudiante al curso
	    			@asignadosCurso[plan.curso.id][id]=true
	    			asignadas+=1
	    			#Modificar las cuaentas para indicar que el estudiante fue asignado
					if @cuantasEstudiantes[id].nil?
						@cuantasEstudiantes[id]=1
					else
						@cuantasEstudiantes[id]+=1
					end
					if @asignadasEstudiantes[id].nil?
						@asignadasEstudiantes[id]=Array.new
					end
					@asignadasEstudiantes[id].push($ofertaDeCursos[plan.curso.id].materia)

	    		end	    		
	    	end
	    end

	    #Para cada conflicto leve
		@otrosConflictos.each do |id,val|
			#Contar cuantas faltan por asignar
			porAsignar=	@demandaEstudiantes[id].demanda-@cuantasEstudiantes[id]
			#Se han asignado 0	
			asignadas=0  			
			#Mirar todos los planes del estudiante
	    	Estudiante.find(id).plans.each do |plan|
	    		#Si ya se le asignaron suficientes terminar
	    		if asignadas==porAsignar
	    			break
	    		end
	    		#Si este curso se esta ofreciendo, queda al menos un cupo libre y este curso no se le asigno previamente al estudiante
	    		if not($ofertaDeCursos[plan.curso.id].nil?||$ofertaDeCursos[plan.curso.id].cupos<=@asignadosCurso[plan.curso.id].count)&&(@asignadosCurso[plan.curso.id][id].nil?||not(@asignadosCurso[plan.curso.id][id]))
	    			#Asignar al estudiante al curso
	    			@asignadosCurso[plan.curso.id][id]=true
	    			asignadas+=1
	    			#Modificar las cuaentas para indicar que el estudiante fue asignado
					if @cuantasEstudiantes[id].nil?
						@cuantasEstudiantes[id]=1
					else
						@cuantasEstudiantes[id]+=1
					end
					if @asignadasEstudiantes[id].nil?
						@asignadasEstudiantes[id]=Array.new
					end
					@asignadasEstudiantes[id].push($ofertaDeCursos[plan.curso.id].materia)
	    		end	    		
	    	end
	    end
	end

	def ultimaOferta(render=true)
		if $ofertaDeCursos.nil?
			sugerirOferta()
		else	
			calcularAsignacionOferta()	
			if render	
				render "optimizador/displayOferta"
			end
		end
	end

	def eliminarOferta
		$ofertaDeCursos.delete(params[:curso_id].to_i)
		obtenerSugerenciaOptima()
		render "optimizador/displayOferta"
	end

	def agregarOferta
		if not(params[:curso_id].nil?||params[:cupos].to_i<=0)
			if $ofertaDeCursos[params[:curso_id].to_i].nil?
				if Curso.exists?(id: params[:curso_id])
					curso=Curso.find(params[:curso_id])
					$ofertaDeCursos[curso.id]=Oferta.new(curso,params[:cupos].to_i)
				end
			else
				$ofertaDeCursos[params[:curso_id].to_i].cupos+=params[:cupos].to_i
			end
		end
		obtenerSugerenciaOptima()	
		render "optimizador/displayOferta"
	end

	def agregarCupo
		if not(params[:curso_id].nil?)
			if not ($ofertaDeCursos[params[:curso_id].to_i].nil?)
				$ofertaDeCursos[params[:curso_id].to_i].cupos+=1
			end
		end
		obtenerSugerenciaOptima()		
		render "optimizador/displayOferta"
	end

	def quitarCupo
		if not(params[:curso_id].nil?)
			if not ($ofertaDeCursos[params[:curso_id].to_i].nil?)
				$ofertaDeCursos[params[:curso_id].to_i].cupos=[$ofertaDeCursos[params[:curso_id].to_i].cupos-1,0].max
				if $ofertaDeCursos[params[:curso_id].to_i].cupos==0
					$ofertaDeCursos.delete(params[:curso_id].to_i)
				end
			end
		end
		obtenerSugerenciaOptima()	
		render "optimizador/displayOferta"
	end

	def calcularAsignacionOferta
		#Calcular número de materias que quiere ver cada estudiante
		demanda=Plan.where(semestre: "201410").find(:all, 
		  :select => '"estudiantes".id as id_estudiante, "estudiantes".nombre, count(curso_id) as demanda', 
		  :joins => :estudiante, 
		  :group => '"estudiantes".id'
		)
		#Guardar resultados en un hash
		@demandaEstudiantes=Hash.new
		demanda.each do |res|
			@demandaEstudiantes[res.id_estudiante]=res
		end

		#Calcular la asiganción de las diferencias materias y contar cuanats materias se asignaron a cada estudiante
		@asignadasEstudiantes=Hash.new	
		@cuantasEstudiantes=Hash.new	
		@ofertaSorted=$ofertaDeCursos.sort_by { |id, oferta| oferta.cupos }.reverse	

		#Guardar la lista de estudiantes asignados a cada curso
		@asignadosCurso=Hash.new

		$ofertaDeCursos.each do |id,oferta|			
			@ofertaCurso=oferta
			obtenerDemandaActual()
			@asignadosCurso[id]=@asignados
			contarAsignadas()
		end
		@conflictosCrtiticos=Hash.new
		@otrosConflictos=Hash.new
		@sinProblemas=Hash.new
		calcularConlfictos()
	end

	def calcularConlfictos
		@demandaEstudiantes.each do |id,est|
			if est.demanda!=0&&(@cuantasEstudiantes[id].nil?||@cuantasEstudiantes[id]==0)
				@conflictosCrtiticos[id]=true
			elsif @cuantasEstudiantes[id]!=est.demanda
				@otrosConflictos[id]=true
			else
				@sinProblemas[id]=true
			end
		end
	end

	def contarAsignadas
		@asignados.each do |id,valor|
			if @cuantasEstudiantes[id].nil?
				@cuantasEstudiantes[id]=1
			else
				@cuantasEstudiantes[id]+=1
			end
			if @asignadasEstudiantes[id].nil?
				@asignadasEstudiantes[id]=Array.new
			end
			@asignadasEstudiantes[id].push(@ofertaCurso.materia)			
		end
	end

	def asignacionCupos	
		if params[:cupos].nil?
			cupos=12
		else
			cupos=params[:cupos].to_i
		end
		idCurso=params[:curso_id].to_i
		#Si el id de curso no es valido
		if idCurso!=0
			curso=Curso.find(idCurso)
		end
		#Si el id era invalido y aun no se a cargado un curso cargar el primero de la base de datos
		if curso.nil?
			curso=Curso.first()
		end
		@ofertaCurso=Oferta.new(curso,cupos)
		obtenerDemandaActual()
		
		#Hacer render a la pagina resultado
		render "optimizador/asignacion"
	end

	def obtenerDemandaActual
		@nCuposTotales=@ofertaCurso.cupos
		@nCuposAsignados=0
		@asignados= Hash.new
		
		#Hacer calculos necesarios
		calcularDemanda()
		asignarEstudiantesAltaPrioridad()
		separarEstudiantes()
		asignarCuposMismaMaestria()
		asignarCuposOtraMaestria()
		asignarCuposPregrado()
		reasignarCuposSobrantes()
	end
	
	def calcularDemanda
		#@asignados[id_estudiante]=true
		#if @asignados[id_estudiante].nil?
		#TODO recibir semestre por parametro
		#Buscar los planes de estudio de los estudiantes donde aparece esta materia
		@demanda=Plan.where(curso_id: @ofertaCurso.materia.id, semestre: "201410")
		#Contar la demanda de los estudiantes
		@demandaCurso=@demanda.count
		#Separar a los estudiantes entre los de maestría (o maestrias de la materia en caso de que sea valida
		#para mas de una, los de tras maestrias y los de pregrado 
	end
	
	def calcularDemandaTodos
		#TODO recibir semestre por parametro
		@res=Plan.where(semestre: "201410").find(:all, 
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
