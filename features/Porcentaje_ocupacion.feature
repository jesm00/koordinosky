#language: en
Feature: Calcular porcentaje de ocupacion
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Porcentaje Ocupacion Sugerir Oferta
		Given I am on "/optimizador/sugerirOferta"
		When I click link "Ver estadisticas"
		Then I should see "% Ocupacion por Curso"
		And I should see "['Curso prueba 1',100.0],['Curso prueba 2',100.0]" 
		