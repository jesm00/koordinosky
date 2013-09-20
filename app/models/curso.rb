class Curso < ActiveRecord::Base
	has_many :validas
	has_many :programas, :through => :validas
	
	has_many :plans
	has_many :estudiantes, :through => :plans
		
	has_many :cursadas
	has_many :estudiantes, :through => :cursadas
	#True si el curso es valido para esa maestria
	def esValida(id_programa)	
		return Valida.exists?(curso_id: id, programa_id: id_programa)
	end
##############################################VALIDACION
  validates :nombre, presence: true, length: { maximum: 50 }
  validates :creditos, presence: true, length: { maximum: 2 }
end
