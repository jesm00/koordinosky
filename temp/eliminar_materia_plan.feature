#language: en
Feature: Eliminar materia plan
	In order to modificar mi plan de estudios
	As a estudiante 
	I want to agregar una materia a mi plan de estudios



	Scenario: Eliminar materia plan
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba 1" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link number "1" in table "table_plans" in row "1" in column "3"
		Then I should see "Se elimino la materia del plan de estudios correctamente"
