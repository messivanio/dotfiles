function dcc
	docker-compose down -v --remove-orphans
	docker-compose up --build -d
	docker-compose logs -f
end