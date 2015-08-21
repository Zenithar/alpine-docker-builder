VERSION := $(shell cat VERSION)

docker-tag: 
	docker build -t drone/alpine-docker:$(VERSION) .
	docker tag -f drone/alpine-docker:$(VERSION) <your-registry>/alpine-docker:$(VERSION)
	docker push <your-registry>/alpine-docker:$(VERSION)

