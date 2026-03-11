SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

APP_IMAGE=weshare-api
APP_PORT=5050
CONTAINER_NAME=weshare-api

.PHONY: help clean test grade build package docker-build docker-run docker-stop docker-logs

# help: @ Lists available make tasks
help:
	@egrep -oh '[0-9a-zA-Z_\.\-]+:.*?@ .*' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sort

# build: @ Alias for docker-build
build: docker-build

# clean: @ Clean the build
clean:
	mvn clean

# test: @ Run all tests
test:
	mvn test

# package: @ Build the jar (skip tests)
package:
	mvn package -DskipTests

# docker-build: @ Build the Docker image (runs package first)
docker-build: package
	docker build -t $(APP_IMAGE) .

# docker-run: @ Run the app in a Docker container
docker-run:
	docker run -d --name $(CONTAINER_NAME) -p $(APP_PORT):$(APP_PORT) $(APP_IMAGE)
	@echo "App running at http://localhost:$(APP_PORT)"

# docker-stop: @ Stop and remove the running container
docker-stop:
	docker stop $(CONTAINER_NAME) && docker rm $(CONTAINER_NAME)

# docker-logs: @ Tail logs from the running container
docker-logs:
	docker logs -f $(CONTAINER_NAME)

# grade: @ Run the grading process for this exercise.
GRADING_FILES = grading.rsync-filter.txt

grade: SUBMISSION_DIR?=${PWD}
grade: GRADER_IMAGE=wethinkcode/grader-java
grade: GRADE_CMD=mvn test
grade:
	@echo +++ Copying protected/grading files over student submission dir: $(SUBMISSION_DIR)
	rsync -av --include-from "$(GRADING_FILES)" . "$(SUBMISSION_DIR)" --ignore-times

	@echo +++ Running grading command
	pushd "$(SUBMISSION_DIR)"
	docker run -t -v $(SUBMISSION_DIR):/app $(GRADER_IMAGE):latest '$(GRADE_CMD)'
	popd

