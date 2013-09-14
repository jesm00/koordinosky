#language: en
Feature: Agregar materia al plan de estudios individual
	In order to planear la oferta de cursos
	As a coordinador 
	I want to ordenar las materias por demanda


	Scenario: Mostrar demanda de materia
		Given I am on "/coordinador"
		When I click link "Obtener demanda de todas las materias"
		Then I should see "Demanda de los cursos registrados"
		And I should see content "Curso prueba 3" in table "table_demanda" in the position "1", "1"
		And I should see content "3" in table "table_demanda" in the position "1", "2"
		And I should see content "Curso prueba 2" in table "table_demanda" in the position "2", "1"
		And I should see content "2" in table "table_demanda" in the position "2", "2"
		And I should see content "Curso prueba 1" in table "table_demanda" in the position "3", "1"
		And I should see content "1" in table "table_demanda" in the position "3", "2"
