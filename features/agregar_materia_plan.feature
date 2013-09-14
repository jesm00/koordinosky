#language: en
Feature: Agregar materia al plan de estudios individual
	In order to modificar mi plan de estudios
	As a estudiante 
	I want to agregar una materia a mi plan de estudios


	Scenario: Materia invalida
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		When I click button "Agregar materia"
		Then I should see "Por favor seleccione un curso"

	Scenario: Exitoso
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		When I choose "Curso prueba"
		And I click button "Agregar materia"
		Then I should see "Plan de estudios del estudiante Estudiante prueba"
		And I should see "Curso prueba"

	Scenario: Plan ya existe
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		And I choose "Curso prueba"
		And I click button "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		When I choose "Curso prueba"
		And I click button "Agregar materia"
		Then I should see "La materia seleccionada ya esta en su plan de estudios"