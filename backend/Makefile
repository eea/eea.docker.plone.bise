image-name-split = $(firstword $(subst :, ,$1))

SHELL=/bin/bash
DOCKERIMAGE_FILE="docker-image.txt"
NAME := $(call image-name-split,$(shell cat $(DOCKERIMAGE_FILE)), 1)
IMAGE=$(shell cat $(DOCKERIMAGE_FILE))

.DEFAULT_GOAL := help

.PHONY: release
release: bump build-image push		## (Host side) release a new version of frontend docker image

.PHONY: bump
bump:
	echo "Bumping version...";
	python ./../scripts/version_bump.py $(DOCKERIMAGE_FILE);

.PHONY: build-image
build-image:
	@echo "Building new docker image: $(IMAGE)";
	docker build --no-cache . -t "$(IMAGE)";
	@echo "Image built."

.PHONY: push
push:
	docker push $(IMAGE)
	docker tag $(IMAGE) $(NAME):latest
	docker push $(NAME):latest

.PHONY: help
help:		## Show this help.
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"
