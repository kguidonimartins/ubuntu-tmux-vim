.DEFAULT_GOAL := help

IMAGE := kguidonimartins/ubuntu-tmux-vim

build: ## build docker image
	docker build -t $(IMAGE) .

run:   ## run docker container
	docker run -it --rm $(IMAGE)

howto: ## inform command to use image sharing volume
	@echo "Use the following command to share files in our current directory with the container:"
	@echo "docker run -it --rm --user root -v $$(pwd):/work -w /work kguidonimartins/ubuntu-tmux-vim"

help:  ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

