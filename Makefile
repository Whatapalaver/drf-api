# docker commands
build:
	docker build .

up:
	docker-compose up --build

down:
	docker-compose down

shell:
	docker exec -ti docker-django_web_1 /bin/bash

# django commands
make-migrations:
	docker-compose run app python manage.py makemigrations

migrate:
	docker-compose run app python manage.py migrate

postgres-shell:
	docker-compose exec db psql -U postgres

py-shell:
	docker-compose run app python manage.py shell

test:
	docker-compose run app sh -c "python manage.py test && black ."