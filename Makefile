export PATH := ./bin:./venv/bin:$(PATH)

YOUR_HOSTNAME := $(shell hostname | cut -d "." -f1 | awk '{print $1}')

export HOST_IP=$(shell curl ipv4.icanhazip.com 2>/dev/null)

username := bossjones
container_name := boss-cheatsheets

SHELL       := $(shell which bash)
GIT_BRANCH  := $(shell git rev-parse --abbrev-ref HEAD)
GIT_SHA     := $(shell git rev-parse HEAD)
BUILD_DATE  := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION     := latest

LOCAL_REPOSITORY = $(HOST_IP):5000

# build:
# 	docker build --tag $(username)/$(container_name):$(GIT_SHA) . ; \
# 	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):latest

# build-and-push: build
# 	docker push $(username)/$(container_name):latest

TAG ?= $(VERSION)
ifeq ($(TAG),@branch)
	override TAG = $(shell git symbolic-ref --short HEAD)
	@echo $(value TAG)
endif

build:
	docker build --tag $(username)/$(container_name):$(GIT_SHA) . ; \
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):latest
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):$(TAG)

build-force:
	docker build --rm --force-rm --pull --no-cache -t $(username)/$(container_name):$(GIT_SHA) . ; \
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):latest
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):$(TAG)

build-local:
	docker build --tag $(username)/$(container_name):$(GIT_SHA) . ; \
	docker tag $(username)/$(container_name):$(GIT_SHA) $(LOCAL_REPOSITORY)/$(username)/$(container_name):latest

tag-local:
	docker tag $(username)/$(container_name):$(GIT_SHA) $(LOCAL_REPOSITORY)/$(username)/$(container_name):$(TAG)
	docker tag $(username)/$(container_name):$(GIT_SHA) $(LOCAL_REPOSITORY)/$(username)/$(container_name):latest

push-local:
	docker push $(LOCAL_REPOSITORY)/$(username)/$(container_name):$(TAG)
	docker push $(LOCAL_REPOSITORY)/$(username)/$(container_name):latest

build-push-local: build-local tag-local push-local

tag:
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):latest
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):$(TAG)

build-push: build tag
	docker push $(username)/$(container_name):latest
	docker push $(username)/$(container_name):$(GIT_SHA)
	docker push $(username)/$(container_name):$(TAG)

push:
	docker push $(username)/$(container_name):latest
	docker push $(username)/$(container_name):$(GIT_SHA)
	docker push $(username)/$(container_name):$(TAG)

push-force: build-force push

shell:
	docker exec -ti $(username)/$(container_name):latest /bin/bash

tail:
	docker logs -f $(container_name)
