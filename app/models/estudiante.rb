class Estudiante < ActiveRecord::Base
	belongs_to :programa
	
    validates_presence_of :programa
    validates_associated :programa
	
	has_many :plans
	has_many :cursos, :through => :plans
	
	has_many :cursadas
	has_many :cursos, :through => :cursadas
end
