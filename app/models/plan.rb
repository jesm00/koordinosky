class Plan < ActiveRecord::Base 
    
	belongs_to :curso
	
    
	validates :curso, :presence=>true	
    
	belongs_to :estudiante
	
	validates :estudiante, :presence=>true	
end
