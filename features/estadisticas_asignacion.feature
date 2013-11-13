#language: en
Feature: Calcular estadisticas de asignacion
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Estadisticas Asignacion Sugerir Oferta
		Given I am on "/optimizador/sugerirOferta"
		When I click link "Ver estadisticas"
		Then I should see "Asignación por Curso"
		And I should see "['Curso prueba 1',12,12,12],['Curso prueba 2',12,12,12]" 
		