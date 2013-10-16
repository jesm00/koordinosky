#language: en
Feature: Asignar Cupos Pregrado
	In order to optimizar la asignacion de cupos
	I want to filtrar los estudiantes de alta prioridad


	Scenario: Asignar cupos estudiantes de pregrado
		Given I am on "/coordinador"
		When I click link "Obtener demanda de una materia"
		And I select "Curso prueba 1" in "curso_id"
		And I click button "Seleccionar curso"
		Then I should see "Asignación de cupos para Curso prueba 1"
		And I should see content "Nombre: Curso prueba 1" in table "table_info_curso" in the position "2", "1"
		And I should see content "Cupos Totales: 12" in table "table_info_curso" in the position "3", "1"
		And I should see content "Cupos Asignados: 12" in table "table_info_curso" in the position "3", "2"
		And I should see content "Estudiantes Interesados (12)" in table "table_interesados" in the position "1", "1"
		And I should see content "Estudiante prueba 1" in table "tabla_a_desplegar4" in the position "3", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "3", "4"
		And I should see content "Estudiante prueba 2" in table "tabla_a_desplegar4" in the position "4", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "4", "4"
		And I should see content "Estudiante prueba 3" in table "tabla_a_desplegar4" in the position "5", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "5", "4"
		And I should see content "Estudiante prueba 4" in table "tabla_a_desplegar4" in the position "6", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "6", "4"
		And I should see content "Estudiante prueba 5" in table "tabla_a_desplegar4" in the position "7", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "7", "4"
		And I should see content "Estudiante prueba 6" in table "tabla_a_desplegar4" in the position "8", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "8", "4"
		And I should see content "Estudiante prueba 7" in table "tabla_a_desplegar4" in the position "9", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "9", "4"
		And I should see content "Estudiante prueba 8" in table "tabla_a_desplegar4" in the position "10", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "10", "4"
		And I should see content "Estudiante prueba 9" in table "tabla_a_desplegar4" in the position "11", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "11", "4"
		And I should see content "Estudiante prueba 10" in table "tabla_a_desplegar4" in the position "12", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "12", "4"
		And I should see content "Estudiante prueba 11" in table "tabla_a_desplegar4" in the position "13", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "13", "4"
		And I should see content "Estudiante prueba 12" in table "tabla_a_desplegar4" in the position "14", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "14", "4"

	Scenario: Asignar cupos estudiantes de pregrado
		Given I am on "/coordinador"
		When I click link "Obtener demanda de una materia"
		And I select "Curso prueba 2" in "curso_id"
		And I click button "Seleccionar curso"
		Then I should see "Asignación de cupos para Curso prueba 2"
		And I should see content "Nombre: Curso prueba 2" in table "table_info_curso" in the position "2", "1"
		And I should see content "Cupos Totales: 12" in table "table_info_curso" in the position "3", "1"
		And I should see content "Cupos Asignados: 6" in table "table_info_curso" in the position "3", "2"
		And I should see content "Estudiantes Interesados (6)" in table "table_interesados" in the position "1", "1"
		And I should see content "Estudiante prueba 1" in table "tabla_a_desplegar4" in the position "3", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "3", "4"
		And I should see content "Estudiante prueba 2" in table "tabla_a_desplegar4" in the position "4", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "4", "4"
		And I should see content "Estudiante prueba 3" in table "tabla_a_desplegar4" in the position "5", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "5", "4"
		And I should see content "Estudiante prueba 4" in table "tabla_a_desplegar4" in the position "6", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "6", "4"
		And I should see content "Estudiante prueba 5" in table "tabla_a_desplegar4" in the position "7", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "7", "4"
		And I should see content "Estudiante prueba 6" in table "tabla_a_desplegar4" in the position "8", "1"
		And I should see content "4" in table "tabla_a_desplegar4" in the position "8", "4"

