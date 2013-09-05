class Plan < ActiveRecord::Base 
    
	belongs_to :curso
	
    validates_presence_of :curso
    validates_associated :curso
    
	belongs_to :estudiante
		
    validates_presence_of :estudiante
    validates_associated :estudiante
end
