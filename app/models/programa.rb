class Programa < ActiveRecord::Base
	has_many :validas
	has_many :cursos, :through => :validas
	
	has_many :estudiantes
end
