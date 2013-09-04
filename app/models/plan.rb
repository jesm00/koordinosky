class Plan < ActiveRecord::Base
	belongs_to :estudiante
	belongs_to :curso
end
