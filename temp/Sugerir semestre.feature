#language: en
Feature: Sugerir Semestre
	In order to optimizar la asignacion de cupos
	I want to determinar los conflictos de horario

	Scenario: Sin llenar
		Given I am on "/optimizador/sugerirSemestre"
		When I click link "Obtener Sugerencia"
		Then I should see "CURSOS SUGERIDOS"

	Scenario: Llenar global
		Given I am on "/optimizador/sugerirSemestre"
		When I fill in "minimo" with "10"
		And I fill in "maximo" with "20"
		And I check "chk_all"
		And I click link "Asignar"
		And I click link "Obtener Sugerencia"
		Then I should see "CURSOS SUGERIDOS"
		