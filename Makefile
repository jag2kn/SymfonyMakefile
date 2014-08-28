all:
	@echo "Opciones: crud, assets, cache, permisos, db, install"
	@echo "Generar entidades: php app/console doctrine:generate:entities Acme/UserBundle/Entity/User"

crud:
	@echo "php app/console doctrine:generate:crud --entity=AcmeUserBundle:User --route-prefix=user --with-write --format=annotation --overwrite"
		
assets:
	sudo chown $(shell whoami):www-data web/bundles -R
	sudo chmod ug+rw  app/cache web/bundles -R
	sudo su www-data -c "php app/console assets:install ./web --symlink"

cache:
	make permisos
	sudo su www-data -c "php app/console cache:clear"
	sudo su www-data -c "php app/console cache:clear --env=prod --no-debug"
	make permisos

permisos:
	sudo chown $(shell whoami):www-data app/cache -R
	sudo chown $(shell whoami):www-data app/logs -R
	sudo chmod g+rw app/cache -R
	sudo chmod g+rw app/logs -R

db:
	make cache
	php app/console doctrine:schema:drop --force
	php app/console doctrine:schema:create
	php app/console doctrine:fixtures:load --no-interaction
	make cache

install:
	sudo apt-get install apache2 php5 mysql-server curl git
	curl -sS https://getcomposer.org/installer | php
	php composer.phar install
	make cache
