SymfonyMakefile
===============

Scripts para automatización de procesos en Symfony sobre GNU/Linux


Licencia
========

AGPL V3


Funciones
=========

all:
	Muestra las opciones que se tienen

crud:
	Muestra una ejemplo para ajustar setters y getters
		
assets:
	Realiza instalación de assets mediante link symbolico

cache:
	Realiza limpieza de cache con ajuste de permisos

permisos:
	Ajusta permisos en carpetas con www-data (apache por defecto)

db:
	Borra la base de datos, la crea nuevamente y la pobla con fixtures

install:
	Realiza la instalación de dependencias y deja en producción

