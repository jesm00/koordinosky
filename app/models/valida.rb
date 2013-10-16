class Valida < ActiveRecord::Base
	belongs_to :curso
	
    validates_presence_of :curso
    validates_associated :curso
    
	belongs_to :programa
	
    validates_presence_of :programa
    validates_associated :programa
end
