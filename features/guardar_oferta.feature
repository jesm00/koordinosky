#language: en
Feature: Guardar Oferta
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Guardar Oferta
		Given I am on "/optimizador/sugerirOferta"
		When I click link "Guardar escenario"
		And I fill in "Nombre" with "Escenario prueba"
		And I click button "Create Escenario"
		Then I should see "Listing escenarios"
		And I should see "Escenario prueba"
		
	Scenario: Ver Oferta Guardada
		Given I am on "/optimizador/sugerirOferta"
		When I click link "Guardar escenario"
		And I fill in "Nombre" with "Escenario prueba"
		And I click button "Create Escenario"
		And I click link number "1" in table "table_escenarios" in row "1" in column "2"
		Then I should see "CURSOS SUGERIDOS"