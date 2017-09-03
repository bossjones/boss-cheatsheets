project := boss-cheatsheets
projects := boss-cheatsheets
username := bossjones
container_name := boss-cheatsheets

# label-schema spec: http://label-schema.org/rc1/

#CONTAINER_VERSION  = $(shell \cat ./VERSION | awk '{print $1}')
GIT_BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
GIT_SHA     = $(shell git rev-parse HEAD)
BUILD_DATE  = $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

build:
	docker build --tag $(username)/$(container_name):$(GIT_SHA) . ; \
	docker tag $(username)/$(container_name):$(GIT_SHA) $(username)/$(container_name):latest

build-and-push: build
	docker push $(username)/$(container_name):latest
