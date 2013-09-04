class Curso < ActiveRecord::Base
	has_many :validas
	has_many :programas, :through => :validas
	
	has_many :plans
	has_many :estudiantes, :through => :plans
		
	has_many :cursadas
	has_many :estudiantes, :through => :cursadas
end
