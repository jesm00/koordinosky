#language: en
Feature: Agregar Curso Oferta
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Agregar Curso Oferta
		Given I am on "/coordinador"
		When I click link "Obtener oferta sugerida"
		And I should see "CURSOS SUGERIDOS"
		And I select "Curso prueba 1" in "curso_id"
		And I fill in "cupos" with "10"
		And I click button "Agregar oferta"
		Then I should see content "Curso prueba 1" in table "table_oferta" in the position "1", "1"
		And I should see content "10" in table "table_oferta" in the position "1", "2"