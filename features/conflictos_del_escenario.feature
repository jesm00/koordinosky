#language: en
Feature: Sugerir Oferta
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Sin conflictos
		Given I am on "/optimizador/sugerirOferta"
		Then I should see content "Conflictos Criticos(0)" in table "table_conflictos_criticos" in the position "1", "1"
		And I should see content "Conflictos Leves(0)" in table "table_otros_conflictos" in the position "1", "1"

	Scenario: Solo conflictos criticos
		Given I am on "/optimizador/sugerirOferta"
		And I click link number "1" in table "table_oferta" in row "1" in column "3"
		And I click link number "1" in table "table_oferta" in row "1" in column "3"
		Then I should see content "Conflictos Criticos(12)" in table "table_conflictos_criticos" in the position "1", "1"
		And I should see content "Conflictos Leves(0)" in table "table_otros_conflictos" in the position "1", "1"

	Scenario: Solo conflictos leves
		Given I am on "/optimizador/sugerirOferta"
		And I click link number "1" in table "table_oferta" in row "1" in column "3"
		Then I should see content "Conflictos Criticos(0)" in table "table_conflictos_criticos" in the position "1", "1"
		And I should see content "Conflictos Leves(12)" in table "table_otros_conflictos" in the position "1", "1"
		
	Scenario: Conflictos leves y criticos
		Given I am on "/optimizador/sugerirOferta"
		And I click link number "1" in table "table_oferta" in row "1" in column "3"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		And I click link number "2" in table "table_oferta" in row "1" in column "4"
		Then I should see content "Conflictos Criticos(6)" in table "table_conflictos_criticos" in the position "1", "1"
		And I should see content "Conflictos Leves(6)" in table "table_otros_conflictos" in the position "1", "1"


	Scenario: Display estadisticas
		Given I am on "/optimizador/sugerirOferta"
		And I click link "Ver estadisticas"
		Then I should see "Resumen de Conflictos"
		