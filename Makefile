ORG=ddresearch
NAME=registrator
VERSION=$(shell cat VERSION)
DEV_RUN_OPTS ?= consul:

dev:
	docker build -f Dockerfile.dev -t $(NAME):dev .
	docker run --rm \
		-v /var/run/docker.sock:/tmp/docker.sock \
		$(NAME):dev /bin/registrator $(DEV_RUN_OPTS)

build:
	mkdir -p build
	go build -ldflags "-X main.Version=$(cat VERSION)" -o build/registrator
	docker build -t $(ORG)/$(NAME) -t $(ORG)/$(NAME):$(VERSION) .

.PHONY: build
