class Programa < ActiveRecord::Base
	has_many :validas
	has_many :cursos, :through => :validas
	
	has_many :pensums

	has_many :estudiantes
##############################################VALIDACION
  validates :nombre, presence: true, length: { maximum: 100 }
  validates :duracion, presence: true, length: { maximum: 2 }	
end
