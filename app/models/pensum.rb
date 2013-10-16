class Pensum < ActiveRecord::Base
	
	belongs_to :curso	
    
	validates :curso, :presence=>true	
    
	belongs_to :programa
	
	validates :programa, :presence=>true	
end
