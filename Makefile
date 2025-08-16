VERSION := 0.0.1
DOCKER_NAME := vscode-dev
REPO_NAME := runeharvest
IMAGE_NAME := vscode-dev

docker-build:
	@docker build -t $(DOCKER_NAME) -f Dockerfile.dev .
docker-push: docker-build
	@docker tag $(DOCKER_NAME) $(REPO_NAME)/$(IMAGE_NAME):$(VERSION)
	@docker push $(REPO_NAME)/$(IMAGE_NAME):$(VERSION)
	@docker tag $(DOCKER_NAME) $(REPO_NAME)/$(IMAGE_NAME):latest
	@docker push $(REPO_NAME)/$(IMAGE_NAME):latest
docker-login:
	@docker login -u $(REPO_NAME)