setup:
	cp .env.example .env
	cp api/api/settings/local_example.py api/api/settings/local.py

up:
	docker-compose up -d

# When django-admin creates files (makemigrations, startapp, etc) we need to own
# the files to modify them.
chown:
	sudo chown -R ${USER}:${USER} .

migrate:
	docker-compose exec web ./manage.py migrate

makemigrations:
	docker-compose exec web ./manage.py makemigrations
	make chown

shell:
	docker-compose exec web ./manage.py shell

test:
	# docker-compose exec web ./manage.py test --noinput
	docker-compose exec web ./manage.py test
