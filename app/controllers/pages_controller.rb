class PagesController < ApplicationController
	def estudiante
		@estudiante=Estudiante.find(params[:estudiante_id])
	end
end
