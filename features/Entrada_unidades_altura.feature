#language: en
Feature: Agregar materia al plan de estudios individual
	In order to modificar mi plan de estudios
	As a estudiante 
	I want to agregar una materia a mi plan de estudios


	Scenario: Entrada in
		Given I am on "/estudiantes/seleccionar"
		And I select "Estudiante prueba" in "estudiante_id"
		And I click "Seleccionar estudiante"
		And I click "Agregar materia"
		And I click "Agregar materia al plan de estudios"
		Then I should see "Su peso ideal es:"
