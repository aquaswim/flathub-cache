.PHONY: build-docker-image run
build-docker-image:
	docker build -t flathub-cache .

run: build-docker-image
	docker run --rm --name fcc -p 8080:80 flathub-cache