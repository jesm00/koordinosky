#language: en
Feature: Cargar informacion
	In order to optimizar la asignacion de cupos
	I want to filtrar los estudiantes de alta prioridad

	Scenario: Cargar informacion
		Given I am on "/cargarDatos"
		Then I should see "Datos cargados correctamente"
		And The program "MATI" should exist
		And The student "MAGDIEL WILDER MARTINEZ ANGULO" should exist
		And The subject "ARTI-4201" should exist		
		And The student "MAYERLI ROMERO DIAZ" should exist
		And The subject "ARTI-4101" should exist
		And The subject "ARTI-4101" is valid for the program "MATI"