class Oferta < ActiveRecord::Base  
  self.table_name = "ofertas"
	belongs_to :curso
	
    validates_presence_of :curso
    validates_associated :curso
    
	belongs_to :escenario
	
    validates_presence_of :escenario
    validates_associated :escenario

end
