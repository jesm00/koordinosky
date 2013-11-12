#language: en
Feature: Optimizar sugerencia de cursos
	In order to optimizar la asignacion de cupos
	I want to optimizar la sugerencia de cupos para el semestre

	Scenario: Optimizar sugerencia
		Given I am on "/optimizador/sugerirOferta"
		Then I should see "CURSOS SUGERIDOS"
		And I should see content "Curso prueba 2" in table "table_oferta" in the position "1", "1"
		And I should see content "1" in table "table_oferta" in the position "1", "2"
		And I should see content "Curso prueba 1" in table "table_oferta" in the position "2", "1"
		And I should see content "1" in table "table_oferta" in the position "2", "1"
		And I click link number "1" in table "table_oferta" in row "2" in column "3"
		And I should see content "Conflictos Criticos(1)" in table "table_conflictos_criticos" in the position "1", "1"
		And I click link number "1" in table "table_oferta" in row "1" in column "4"
		And I should see content "Conflictos Criticos(0)" in table "table_conflictos_criticos" in the position "1", "1"