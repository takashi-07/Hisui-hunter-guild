.PHONY: hello clean

n:
	sudo docker-compose run web rails new . myapp --css tailwind --force --database=mysql && \
	sudo docker-compose build && \
	sudo chmod -R 777 src && \
	docker-compose up -d

d:
	sudo docker-compose run web rails db:create && \
	sudo docker-compose run web rails db:migrate && \
	sudo chmod -R 777 src && \
	docker-compose up -d && \
	docker-compose ps 

b:
	docker-compose build && \
	docker-compose up -d && \
	docker-compose ps

u:
	docker-compose up -d && \
	docker-compose ps

down:
	docker-compose down && \
	docker-compose ps -a

m:
	sudo docker-compose run web rails db:migrate && \
	sudo chmod -R 777 src 

r:
	docker-compose run web rails routes

s:
	sudo chmod -R 777 src
	
t:
	docker-compose run web rails tailwindcss:watch[always]
	
c:
	docker-compose down && \
	docker system prune -a && \
	docker-compose ps -a
