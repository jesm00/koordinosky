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
end
