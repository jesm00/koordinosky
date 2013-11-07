#language: en
Feature: Agregar materia al plan de estudios individual
	In order to modificar mi plan de estudios
	As a estudiante 
	I want to agregar una materia a mi plan de estudios



	Scenario: Agregar materia valida
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		And I select "Curso prueba" in "plan_curso_id"
		And I click button "Agregar materia"
		Then I should see "Plan de estudios del estudiante Estudiante prueba"
		And I should see "Curso prueba"

	Scenario: Agregar materia repetida
		Given I am on "/estudiantes/seleccionar"
		When I select "Estudiante prueba" in "estudiante_id"
		And I click button "Seleccionar estudiante"
		And I click link "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		And I select "Curso prueba" in "plan_curso_id"
		And I click button "Agregar materia"
		And I click link "Agregar materia al plan de estudios"
		And I select "Curso prueba" in "plan_curso_id"
		And I click button "Agregar materia"
		Then I should see "La materia seleccionada ya esta en su plan de estudios"
