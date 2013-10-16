#language: en
Feature: Sugerir Oferta
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Sugerir Oferta
		Given I am on "/coordinador"
		When I click link "Obtener oferta sugerida"
		Then I should see "CURSOS SUGERIDOS"
		And I should see content "Curso prueba 1" in table "table_oferta" in the position "1", "1"
		And I should see content "Curso prueba 2" in table "table_oferta" in the position "2", "1"
		And I should see content "Conflictos Criticos(0)" in table "table_conflictos_criticos" in the position "1", "1"
		And I should see content "Conflictos Leves(0)" in table "table_otros_conflictos" in the position "1", "1"
		And I should see content "Demanda Total de Cupos(12)" in table "table_demanda_cursos" in the position "1", "1"
		