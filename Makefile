.PHONY: run build kill tty

NAME := Airflow
LOCALPORT := 8080

build:
	docker build --rm -t puckel/docker-airflow .

run: build
	docker run --rm --name=$(NAME) --mount source=$(PWD)/dags,target=/usr/local/airflow/dags,type=bind -d -p 8080:$(LOCALPORT) puckel/docker-airflow
	@echo Airflow running on http://localhost:$(LOCALPORT)

kill:
	@echo Killing $(NAME)
	docker kill $(NAME)

tty:
	docker exec -i -t $(NAME) /bin/bash

