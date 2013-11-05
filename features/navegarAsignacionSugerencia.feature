#language: en
Feature: Navegar asignacion
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Ir a asignacion
		Given I am on "/optimizador/sugerirOferta"
		When I click link number "1" in table "table_oferta" in row "1" in column "1"
		Then I should see "Asignación de cupos para"	

	Scenario: Volver a sugerencia
		Given I am on "/optimizador/sugerirOferta"
		When I click link number "1" in table "table_oferta" in row "1" in column "1"
		And I click button "Volver"
		Then I should see "CURSOS SUGERIDOS"
