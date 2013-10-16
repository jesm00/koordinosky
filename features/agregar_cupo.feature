#language: en
Feature: Agregar Cupo
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Agregar Cupo
		Given I am on "/coordinador"
		When I click link "Obtener oferta sugerida"
		Then I should see "CURSOS SUGERIDOS"
		And I click link number "1" in table "table_oferta" in row "1" in column "4"
		And I should see content "13" in table "table_oferta" in the position "1", "2"