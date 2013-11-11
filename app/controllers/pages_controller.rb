class PagesController < ApplicationController
	def estudiante
		@estudiante=Estudiante.find(params[:estudiante_id])
	end

	def cargarDatos
		require 'open-uri'
		jsonString=""
		open("http://184.72.239.150:3000/get_json") do |f|
  			jsonString = f.read
		end
		require 'json'
		jsonHash = JSON.parse jsonString
		
		jsonHash.each do |programa, estudiantes|
			if (Programa.where(:nombre=>programa).first.nil?)
				Programa.create(:nombre=>programa,:es_maestria=>true,:duracion=>4)
			end
			programaObject=Programa.where(:nombre=>programa).first
			estudiantes.each do |codigo,datos|	
				if(Estudiante.where(:nombre=>datos["name"]).first.nil?)		
					Estudiante.create(:nombre=>datos["name"],:email=>datos["name"].split(' ')[0]+"@uniandes.edu.co",:semestre_actual=>(datos["subjects"].count/2.0).floor,:programa_id=>programaObject.id,:password=>"pass1234",:password_confirmation=>"pass1234")
				end
				datos["subjects"].each do |curso|
					if(Curso.where(:nombre=>curso).first.nil?)
						Curso.create(:nombre=>curso,:creditos=>4)
					end
					cursoObject=Curso.where(:nombre=>curso).first	
					if(Valida.where(:curso_id=>cursoObject.id,:programa_id=>programaObject.id).first.nil?)
						Valida.create(:curso_id=>cursoObject.id,:programa_id=>programaObject.id)
					end
				end
			end
		end

	end
end
